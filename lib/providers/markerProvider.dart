import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/article.dart';
import '../models/customMarker.dart';
import 'package:flutter/material.dart';

class MarkerProvider with ChangeNotifier {
  List<CustomMarker> _markers = [];

  List<CustomMarker> get markers {
    return [..._markers];
  }

  /// Initialise _articles avec les données stockées dans la base de donnée
  Future<void> fetchAndSetMarker() async {
    final List<CustomMarker> _liste = [];

    await FirebaseFirestore.instance
        .collection('markers')
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
              _liste.add(CustomMarker(
                  id: element.id,
                  idArticle: element.get('idArticle'),
                  latitude: element.get('latitude'),
                  longitude: element.get('longitude')));
            }))
        .onError((error, stackTrace) => error);

    _markers = [..._liste];
    _markers.sort((a, b) => b.latitude.compareTo(a.latitude));

    notifyListeners();
  }

  /// @args item Marqueur à ne pas changer
  ///Remets l'attribut isVisible de tous les markers à false sauf item
  void resetMarker(CustomMarker item) {
    for (var i = 0; i < _markers.length; i++) {
      if (_markers[i] != item) _markers[i].isVisible = false;
    }
    notifyListeners();
  }

  /// Remets l'attribut isVisible de tous les markers à false
  void resetAllMarker() {
    for (var i = 0; i < _markers.length; i++) {
      _markers[i].isVisible = false;
    }
  }

  ///@return  - true si l'attribut isVisble d'un marker est true
  ///         - false si aucun marker a l'attribut isVisble à true
  bool markerOpen() {
    for (var i = 0; i < _markers.length; i++) {
      if (_markers[i].isVisible == true) return true;
    }
    return false;
  }

  /// @args id Identifiant  d'un marqueur
  ///  Change l'attribut du marqueur avec l'identifant 'id' à true
  void favorite(String id) {
    var i = _markers.indexWhere((item) => item.id == id);
    _markers[i].isFavorite = true;
    notifyListeners();
  }

  /// @args id Identifiant  d'un marqueur
  /// Change l'attribut du marqueur avec l'identifant 'id' à false
  void unfavorite(String id) {
    var i = _markers.indexWhere((item) => item.id == id);
    _markers[i].isFavorite = false;
    notifyListeners();
  }

  /// @args - listArticle Liste d'article
  /// @return Liste de marqueur provenant de listArticle
  List<CustomMarker> markersFilter(List<Article> listArticle) {
    List<CustomMarker> _list = [];
    if (listArticle.isEmpty) {
      return [];
    }

    for (var i = 0; i < listArticle.length; i++) {
      for (var j = 0; j < _markers.length; j++) {
        if (_markers[j].idArticle == listArticle[i].id) _list.add(_markers[j]);
      }
    }
    return _list.toSet().toList();
  }

  void addMarker(CustomMarker marker) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection('markers').doc(marker.id).set(marker.toJson());

    _markers.add(marker);
    notifyListeners();
  }
}
