import '../models/User.dart';
import 'package:flutter/material.dart';

class CommentaireModel {
  /// Identifiant du commentaire
  final String identifiant;

  /// le contenu du commentaire
  final String contenu;

  /// l'auteur du commentaire
  final UserCustom auteur;

  /// l'identifiant de l'aticle contenant le commentaire
  final String idArticle;

  /// la date du commentaire
  final DateTime date;

  const CommentaireModel({
    @required this.identifiant,
    @required this.auteur,
    @required this.date,
    @required this.idArticle,
    this.contenu = '',
  });
}
