import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/customMarker.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  /// liste de markers favoris de l'utilisateur
  List<CustomMarker> _markers = [];

  /// la liste de favoris d'un utilisateur
  List<String> _favoris = [];

  List<CustomMarker> get markers {
    return [..._markers];
  }

  /// initialise la liste de favoris avec les données stockées dans la base de données
  Future<void> fetchAndSetFavoris() async {
    final List<CustomMarker> _liste = [];
    final List<CustomMarker> _listeMar = [];
    List<String> _listeUser = [];

    await FirebaseFirestore.instance
        .collection('markers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
        _liste.add(CustomMarker(
          id: element.id,
          latitude: element.get('latitude'),
          longitude: element.get('longitude'),
          idArticle: element.get('idArticle'),
        ));
      });
    });

    /// récupérer la liste des utilisateurs de la base de données
    await FirebaseFirestore.instance.collection('utilisateur').get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((element) {
              if (element.id == FirebaseAuth.instance.currentUser.uid) {
                var x = element.get('favoris');
                _listeUser = [...x];
                _listeUser.forEach((idMarkerUser) {
                  _liste.forEach((elem1) {
                    if (idMarkerUser == elem1.id) {
                      _listeMar.add(elem1);
                    }
                  });
                });
              }
            }));

    _markers = [..._listeMar];
    _favoris = [..._listeUser];

    notifyListeners();
  }

  /// @args marker - marqueur à ajouter
  /// Ajoute le marqueur de la liste de favori
  void add(CustomMarker marker) {
    _markers.add(marker);

    notifyListeners();
  }

  /// @args le marker à ajouter
  ///permet d'ajouter un marker dans la liste de favoris
  void addFavoris(String marker) {
    _favoris.add(marker);

    notifyListeners();
  }

  /// @return la liste de favoris de l'utilisateur
  List<String> get favoris {
    return [..._favoris];
  }

  /// @args l'identifiant du marker à supprimer et son id
  /// permet de supprimer un marker de la liste des favoris
  void delete(String id, CustomMarker marker) {
    _favoris.remove(id);
    _markers.remove(marker);

    FirebaseFirestore.instance
        .collection("utilisateur")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"favoris": _favoris});
    notifyListeners();
  }

  /// Renvoi le marquer selon id en argument
  CustomMarker idToMarker(String id) {
    return _markers.firstWhere((element) => element.id == id);
  }

  void clear() {
    _favoris.clear();
    _markers.clear();
  }
}
