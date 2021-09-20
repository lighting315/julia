import 'package:aura2/providers/markerProvider.dart';
import 'package:provider/provider.dart';

import '../../models/User.dart';

import '../markerWidgets/articleItem.dart';
import 'listeCommentaires.dart';
import '../../models/article.dart';
import 'package:flutter/material.dart';

class FenetreArticleCom extends StatefulWidget {
  final UserCustom user;
  final bool auth;

  /// Position de l'article sur l'écran
  final double position;

  /// Fonction premettant le slide
  final Function slide;

  /// Article à afficher
  final Article article;

  /// Function permettant le changement de l'attribut isFavorite d'un marqueur
  final Function changeFavorite;

  /// Identifiant du marqueur à changer
  final String idMaker;

  /// Etat du bouton Favori
  final bool like;

  /// Fonction permettant de changer la position
  final Function setPosition;

  /// true si on passe d'un article à un autre
  /// false si on ouvre la fenetre d'article
  final bool switchArticle;

  // Permet de verifier s'il l'on passe d'un article à un autre
  final Function switchFalse;

  FenetreArticleCom(
      {this.position,
      this.user,
      this.slide,
      this.article,
      this.changeFavorite,
      this.idMaker,
      this.switchArticle,
      this.switchFalse,
      this.like,
      this.setPosition,
      this.auth});

  @override
  _FenetreArticleComState createState() => _FenetreArticleComState();
}

class _FenetreArticleComState extends State<FenetreArticleCom> {
  bool _comm = false;

  /// Switch entre la section article et commentaire
  void _switch() {
    setState(() {
      _comm = !_comm;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Taille de la fenêtre article
    double _height = MediaQuery.of(context).size.height - widget.position;

    /// Cache l'article totalement
    void _hide() {
      if (widget.position >
          MediaQuery.of(context).size.height -
              200 -
              kBottomNavigationBarHeight) {
        widget.setPosition(MediaQuery.of(context).size.height);
        Provider.of<MarkerProvider>(context, listen: false).resetAllMarker();
      }
    }

    /// Permet le plein écran de la fenetre
    void _fullWidth() {
      if (widget.position < MediaQuery.of(context).size.height * 0.1) {
        widget.setPosition(MediaQuery.of(context).size.height * 0.1 - 0.1);
        setState(() {
          _height = MediaQuery.of(context).size.height;
        });
      } else
        _height = MediaQuery.of(context).size.height * 0.9;
    }

    _fullWidth();
    _hide();

    return AnimatedPositioned(
      duration: Duration(
        milliseconds: widget.position < MediaQuery.of(context).size.height * 0.9
            ? 1
            : 300,
      ),
      curve: Curves.linear,
      top:
      widget.position < MediaQuery.of(context).size.height * 0.1
          ? 0
          : widget.position,
      child: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          widget.slide(details);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: _height,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    height: 25,
                    color: Colors.white,
                    width: double.infinity,
                    child: Icon(
                      _height == MediaQuery.of(context).size.height
                          ? Icons.expand_more
                          : Icons.expand_less_rounded,
                      size: 30,
                      color: Colors.black54,
                    )),
                Expanded(
                  child: _comm
                      ? ListCommentaire(
                          switchToArticle: _switch,
                          article: widget.article.id,
                          user: widget.user)
                      : ArticleItem(
                          article: widget.article,
                          changeFavorite: widget.changeFavorite,
                          idMaker: widget.idMaker,
                          like: widget.like,
                          switchArticle: widget.switchArticle,
                          switchFalse: widget.switchFalse,
                          switchToComm: _switch,
                        ),
                )
              ],
            )),
      ),
    );
  }
}
