import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/CommentaireModel.dart';
import '../../providers/commentProvider.dart';
import '../../utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Classe qui permet d'afficher un commentaire avec la date, l'auteur, le contenu

class CommentaireItem extends StatefulWidget {
  final CommentaireModel commentaire;

  CommentaireItem({
    this.commentaire,
  });
  @override
  _CommentaireItemState createState() => _CommentaireItemState();
}

class _CommentaireItemState extends State<CommentaireItem> {
  /// true si le commentaire est affiché en entier, false si on affiche maximum 4 lignes du commentaire
  bool texteCommentaire = false;

  @override
  Widget build(BuildContext context) {
    final commentaireData =
        Provider.of<CommentaireProvider>(context, listen: false);

    /// @return renvoie l'auteur du commentaire(nom + prénom)
    String getAuteur() {
      return commentaireData
              .markerToCommentaire(widget.commentaire.identifiant)
              .auteur
              .nom +
          ' ' +
          commentaireData
              .markerToCommentaire(widget.commentaire.identifiant)
              .auteur
              .prenom;
    }

    /// @return renvoi la date du commentaire
    DateTime getDate() {
      return commentaireData
          .markerToCommentaire(widget.commentaire.identifiant)
          .date;
    }

    /// @return renvoie le contenu du commentaire
    String gettexteCommentaire() {
      return commentaireData
          .markerToCommentaire(widget.commentaire.identifiant)
          .contenu;
    }

    /// permet d'afficher une partie du commentaire qui ne dépasse pas 4 lignes
    Widget afficherPartieCommentaire() {
      return Container(
        padding: EdgeInsets.all(20),
        child: TextButton(
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: gettexteCommentaire(),
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'myriad',
                color: Colors.black,
              ),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
          onPressed: () {
            // setState(() {
            //   texteCommentaire = !texteCommentaire;
            // });
          },
        ),
      );
    }

    ///permet d'afficher l'intégralité du commentaire
    Widget afficherToutCommentaire() {
      return GestureDetector(
        // onTap: () {
        //   setState(() {
        //     texteCommentaire = !texteCommentaire;
        //   });
        // },
        child: Container(
          padding: EdgeInsets.all(20),
          child: SelectableText(
            gettexteCommentaire(),
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'myriad',
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    int jour = getDate().day;
    int mois = getDate().month;
    int annee = getDate().year;

    return GestureDetector(
      onTap: () {
        setState(() {
          texteCommentaire = !texteCommentaire;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.linear,
        decoration: kBoxDecoStyle,
        margin: EdgeInsets.only(left: 35, right: 35, bottom: 20, top: 0),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    // width: 250,
                    padding: EdgeInsets.only(
                        left: 20, right: 10, bottom: 5, top: 10),
                    child: Text(
                      getAuteur(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'myriad',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  padding:
                      EdgeInsets.only(left: 20, right: 10, bottom: 5, top: 10),
                  child: Text(
                    '$jour.$mois.$annee',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'myriad',
                      fontSize: 11,
                    ),
                  ),
                ),
                if (widget.commentaire.auteur.id ==
                    FirebaseAuth.instance.currentUser.uid)
                  Container(
                    width: 30,
                    child: Center(
                      child: IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            size: 15,
                          ),
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('commentaire')
                                .doc(widget.commentaire.identifiant)
                                .delete();
                            commentaireData.delete(widget.commentaire);
                          }),
                    ),
                  )
              ],
            ),
            if (texteCommentaire == false)
              afficherPartieCommentaire()
            else if (texteCommentaire == true)
              afficherToutCommentaire()
          ],
        ),
      ),
    );
    // ),
    // ]);
  }
}
