import 'package:flutter/cupertino.dart';

class Article {
  /// Identifiant de l'article
  final String id;

  /// Titre de l'article
  final String title;

  /// Description de l'article
  final String text;

  /// Date de l'oeuvre
  final String date;

  /// Nom des architectes de l'oeuvre
  final String architecte;
  // Architecte associé
  final String associe;
  // Architecte transformation
  final String transformation;
  // Architecte des Monuments Historiques
  final String monument;
  // Architecte de projet
  final String projet;
  // Architecte local
  final String local;
  // Chef de projet
  final String chef;
  // Ingenieur
  final String ingenieur;
  // Paysagiste
  final String paysagiste;
  // Urbaniste
  final String urbaniste;
  // Artiste
  final String artiste;
  // Eclairagiste
  final String eclairagiste;
  // Conservateur du musée
  final String musee;
  // Année d'installation à Paris
  final String installation;
  // Dimensions
  final String dimensions;
  // Expositions
  final String expositions;
  // Surface
  final String surface;
  // Surface à construire
  final String construire;
  // Surface d'exposition
  final String surfaceExpo;

  /// Nom des architectes des opérations connexes  de l'oeuvre
  final String operation;

  /// Nom de l'architecte du patrimoine de l'oeuvre
  final String patrimoine;

  /// Adresse
  final String lieu;

  /// Liste de mots-clefs correspondant
  final List<String> tags;

  final String textEn;

  final String audio;

  bool isOpen;

  Article(
      {@required this.id,
      @required this.title,
      this.architecte = '',
      this.operation = '',
      this.patrimoine = '',
      this.lieu = '',
      this.date = '',
      this.textEn = '',
      this.text = '',
      this.audio = '',
      this.artiste = '',
      this.associe = '',
      this.chef = '',
      this.construire = '',
      this.dimensions = '',
      this.eclairagiste = '',
      this.expositions = '',
      this.ingenieur = '',
      this.installation = '',
      this.local = '',
      this.monument = '',
      this.musee = '',
      this.paysagiste = '',
      this.projet = '',
      this.surface = '',
      this.surfaceExpo = '',
      this.transformation = '',
      this.urbaniste = '',
      this.isOpen = false,
      this.tags});

  Map<String, dynamic> toJson() => {
        'title': this.title,
        'architecte': this.architecte,
        'operation': this.operation,
        'patrimoine': this.patrimoine,
        'lieu': this.lieu,
        'date': this.date,
        'textEn': this.textEn,
        'text': this.text,
        'audio': this.audio,
        'tags': this.tags,
        'associe': this.associe,
        'transformation': this.transformation,
        'monument': this.monument,
        'projet': this.projet,
        'local': this.local,
        'chef': this.chef,
        'ingenieur': this.ingenieur,
        'paysagiste': this.paysagiste,
        'urbaniste': this.urbaniste,
        'artiste': this.artiste,
        'eclairagiste': this.eclairagiste,
        'musee': this.musee,
        'installation': this.installation,
        'dimensions': this.dimensions,
        'expositions': this.expositions,
        'surface': this.surface,
        'construire': this.construire,
        'surfaceExpo': this.surfaceExpo,
      };
}
