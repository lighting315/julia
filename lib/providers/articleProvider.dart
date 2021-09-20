import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tag.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];

  /// Initialise _articles avec les données stockées dans la base de donnée
  Future<void> fetchAndSetArticle() async {
    final List<Article> _liste = [];
    await FirebaseFirestore.instance
        .collection("articles")
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
              var x = element.get('tags');
              List<String> listTag = [...x];
              _liste.add(Article(
                id: element.id,
                architecte: element.get('architecte'),
                patrimoine: element.get('patrimoine'),
                text: element.get('text'),
                textEn: element.get('textEn'),
                audio: element.get('audio'),
                artiste: element.get('artiste'),
                associe: element.get('associe'),
                chef: element.get('chef'),
                construire: element.get('construire'),
                musee: element.get('musee'),
                monument: element.get('monument'),
                dimensions: element.get('dimensions'),
                eclairagiste: element.get('eclairagiste'),
                urbaniste: element.get('urbaniste'),
                expositions: element.get('expositions'),
                ingenieur: element.get('ingenieur'),
                installation: element.get('installation'),
                local: element.get('local'),
                paysagiste: element.get('paysagiste'),
                surface: element.get('surface'),
                surfaceExpo: element.get('surfaceExpo'),
                projet: element.get('projet'),
                transformation: element.get('transformation'),
                tags: listTag,
                date: element.get('date'),
                lieu: element.get('lieu'),
                // commentaires: [],
                operation: element.get('operation'),
                title: element.get('title'),
              ));
            }))
        .onError((error, stackTrace) => error.toString());

    _articles = [..._liste];
   
    notifyListeners();
  }
  /// @return Renvoi une liste d'article
  List<Article> get articles {
    return [..._articles];
  }

  /// @args id Identifiant de l'article à renvoyer
  /// @return Article avec l'identifiant égale à id
  Article markerToArticle(String id) {
    return _articles.firstWhere(((article) => article.id == id));
  }

  /// @args - article Article article à séparer
  /// @return List de texte avec text[0] égale à l'introduction
  List<String> getIntro(Article article, bool trad) {
    List<String> text = [];
    text = trad ? article.textEn.split("&intro") : article.text.split("&intro");
    return text;
  }

  /// Renvoi l'article s'il contient le tag
  Article articleToTag(Tag tag, Article article) {
    if (article.tags.contains(tag.id))
      return article;
    else
      return null;
  }

  /// @args - listTag Liste d'étiquette
  /// @return Renvoi une liste d'article contenant une des étiquettes de listTag
  List<Article> articlesFilter(List<Tag> listTag) {
    List<Article> _list = [];

    if (listTag.isEmpty) {
      return [];
    }
    for (var i = 0; i < listTag.length; i++) {
      for (var j = 0; j < _articles.length; j++) {
        if (_articles[j].tags.contains(listTag[i].id)) _list.add(_articles[j]);
      }
    }
    return _list.toSet().toList();
  }

  List<String> getBold(String text) {
    return text.split('&bold');
  }

  String getSign(String text) {
    return text.split('&signature').last;
  }

  /// l'article à ajouter
  /// permet d'ajouter un article dans la liste des articles, également dans la collection articles de firestore
  void addArticle(Article article) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection('articles').doc(article.id).set(article.toJson());

    _articles.add(article);
    notifyListeners();
  }
}
