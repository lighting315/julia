import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/CommentaireModel.dart';
import 'package:flutter/material.dart';

class CommentaireProvider with ChangeNotifier {
  List<CommentaireModel> _commentaires = [];

  /// @return Renvoi une liste de commentaires
  List<CommentaireModel> get commentaires {
    return [..._commentaires];
  }

  Future<void> fetchAndSetComment() async {
    final List<CommentaireModel> _liste = [];
    final List<UserCustom> _listeUser = [];

    await FirebaseFirestore.instance.collection('utilisateur').get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((element) {

              _listeUser.add(UserCustom(
                id: element.id,
                nom: element.get('name'),
                prenom: element.get('prenom'),
                eMail: element.get('eMail'),
                passeword: element.get('password'),
                dateNaissance: element.get('dateNaissance'),
                phone: element.get('phone'),
                sexe: element.get('sexe'),
              ));
            }));
    await FirebaseFirestore.instance
        .collection('commentaire')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
        UserCustom user = _listeUser.firstWhere((user) {
          return user.id == element.get('idAuteur');
        });

        _liste.add(CommentaireModel(
 identifiant: element.id,
            contenu: element.get('contenu'),
            date: element.get('date') == null
                ? DateTime.now()
                : DateTime.fromMicrosecondsSinceEpoch(
                    element.get('date').microsecondsSinceEpoch),
            idArticle: element.get('idArticle'),
            auteur: user));

        print(_liste.length);
      });
    });
    _commentaires = [..._liste];

    notifyListeners();
  }

  /// @args l'identifiant de l'article
  /// @return renvoie la liste des commentaires correspondant à l'article (idArticle)
  List<CommentaireModel> commentaireFrom(String idArticle) {
    var com = [
      ..._commentaires
          .where((element) => element.idArticle == idArticle)
          .toList()
    ];

    com.sort((a, b) => a.date.compareTo(b.date));

    return com;
  }

  ///  @args l'indentifiant du commentaire à renvoyer
  ///  @return un commentaire dont l'indentifiant= id
  CommentaireModel markerToCommentaire(String id) {
    return _commentaires
        .firstWhere(((commentaire) => commentaire.identifiant == id));
  }

  /// @args le commentaire à ajouter
  /// permet d'ajouter un commentaire dans la liste des commentaires
  void add(CommentaireModel commentaire) {
    _commentaires.add(commentaire);
    notifyListeners();
  }

  void delete(CommentaireModel commentaire) {
    _commentaires.remove(commentaire);

    notifyListeners();
  }
}
