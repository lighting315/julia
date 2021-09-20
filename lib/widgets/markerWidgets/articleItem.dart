import '../../providers/tagProvider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../models/article.dart';
import '../../providers/articleProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_sound/flutter_sound.dart';

/// @return renvoie la vue d'un article
class ArticleItem extends StatefulWidget {
  /// Article à afficher
  final Article article;

  /// Function permettant le changement de l'attribut isFavorite d'un marqueur
  final Function changeFavorite;

  /// Identifiant du marqueur à changer
  final String idMaker;

  /// Etat du bouton Favori
  final bool like;

  ///  Affiche l'écran des commentaires
  final Function switchToComm;

  /// Permet de savoir si l'on est passée d'un article à l'autre
  final bool switchArticle;

  final Function switchFalse;

  ArticleItem({
    this.article,
    this.changeFavorite,
    this.idMaker,
    this.switchFalse,
    this.like,
    this.switchArticle,
    this.switchToComm,
  });

  @override
  _ArticleItemState createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  /// Taille du titre
  double _sizeTitre = 20;

  /// Taille de l'info
  double _sizeInfo = 16;

  /// Taille de l'introduction
  double _sizeIntro = 18;

  /// Taille du text
  double _sizeText = 17;

  /// Echelle du slide
  final double _scale = 0.05;

  /// Vrai article en anglais
  /// False article en français
  bool trad = false;

  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;

  /// Vrai si l'audio est en cours
  /// Faux si l'audio est à l'arret
  bool audioState = false;

  @override
  initState() {
    super.initState();
    _mPlayer.openAudioSession().then((value) => setState(() {
          _mPlayerIsInited = true;
        }));
  }

  @override
  void dispose() {
    _mPlayer.closeAudioSession();
    _mPlayer = null;
    super.dispose();
  }

  /// Joue le fichier audio
  void play(url) async {
    setState(() {
      audioState = true;
    });

    if (_mPlayer.isPaused) {
      await _mPlayer.resumePlayer();
    } else
      await _mPlayer.startPlayer(
          fromURI: url,
          codec: Codec.mp3,
          whenFinished: () {
            setState(() {
              audioState = false;
            });
          });
    setState(() {});
  }

  /// Stop le fichier audio
  Future<void> stopPlayer() async {
    setState(() {
      audioState = false;
    });
    if (_mPlayer != null) {
      await _mPlayer.stopPlayer();
    }
  }

  // Met en pause le fichier audio
  Future<void> pausePlayer() async {
    setState(() {
      audioState = false;
    });
    if (_mPlayer.isPlaying) {
      await _mPlayer.pausePlayer();
    }
  }

  /// Change la taille de la police du titre
  void _fontSizeTitre(ScaleUpdateDetails details) {
    if (_sizeTitre < 20) {
      _sizeTitre = 20;
    }
    if (_sizeTitre > 28) {
      _sizeTitre = 28;
    }
    details.scale > 1
        ? _sizeTitre = _sizeTitre + details.scale * _scale
        : _sizeTitre = _sizeTitre - details.scale * _scale;
  }

  /// Change la taille de la police de l'introduction
  void _fontSizeIntro(ScaleUpdateDetails details) {
    if (_sizeIntro < 18) {
      _sizeIntro = 18;
    }
    if (_sizeIntro > 26) {
      _sizeIntro = 26;
    }
    details.scale > 1
        ? _sizeIntro = _sizeIntro + details.scale * _scale
        : _sizeIntro = _sizeIntro - details.scale * _scale;
  }

  /// Change la taille de la police des informations
  void _fontSizeInfo(ScaleUpdateDetails details) {
    if (_sizeInfo < 16) {
      _sizeInfo = 16;
    }
    if (_sizeInfo > 22) {
      _sizeInfo = 22;
    }
    details.scale > 1
        ? _sizeInfo = _sizeInfo + details.scale * _scale
        : _sizeInfo = _sizeInfo - details.scale * _scale;
  }

  /// Change la taille de la police du texte
  void _fontSizeText(ScaleUpdateDetails details) {
    if (_sizeText < 17) {
      _sizeText = 17;
    }
    if (_sizeText > 25) {
      _sizeText = 25;
    }
    details.scale > 1
        ? _sizeText = _sizeText + details.scale * _scale
        : _sizeText = _sizeText - details.scale * _scale;
  }

  /// Action permettant d'agrandir ou reduire la taille de la police
  void _pinch(ScaleUpdateDetails details) {
    setState(() {
      _fontSizeTitre(details);
      _fontSizeInfo(details);
      _fontSizeIntro(details);
      _fontSizeText(details);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Liste de texte avec introdution
    List<String> intro = Provider.of<ArticleProvider>(context, listen: false)
        .getIntro(widget.article, trad);

    /// Liste  des labels
    List<String> labels = Provider.of<TagProvider>(context, listen: false)
        .listLabel(widget.article.tags);

    ///Liste de texte séparant les phrases en gras ou non
    List<String> gras = Provider.of<ArticleProvider>(context, listen: false)
        .getBold(intro.length == 1 ? intro[0] : intro[1]);

    ///Texte représentant la signature
    String sign =
        Provider.of<ArticleProvider>(context, listen: false).getSign(gras.last);

    if (gras.last.contains('&signature')) {
      var _end = gras.last.split('&signature');
      gras.removeLast();
      gras.add(_end[0]);
    }

    /// Mets en gras les String de gras lorsque [i] est impaire
    List<Widget> addBoldToText() {
      List<SelectableText> l = [];
      if (gras.length > 1) {
        for (var i = 1; i < gras.length; i++) {
          if (i % 2 == 1) {
            l.add(SelectableText(
              gras[i],
              style: TextStyle(
                fontFamily: 'myriad',
                fontSize: _sizeText,
                fontWeight: FontWeight.bold,
              ),
            ));
          } else {
            l.add(SelectableText(
              gras[i],
              style: TextStyle(
                fontFamily: 'myriad',
                fontSize: _sizeText,
              ),
            ));
          }
        }
      }
      return l;
    }

    /// Arrête l'audio d'un article si l'on change d'article
    if (widget.switchArticle) {
      stopPlayer();
      widget.switchFalse();
      setState(() {
        audioState = false;
      });
    }

    /// @rgs - item Etiquette à afficher
    /// @return Renvoi le widget d'une étiquette
    Widget _buildChip(String item) {
      return Container(
        child: Text(
          item,
          style: TextStyle(color: Colors.white, fontSize: _sizeInfo),
        ),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(209, 62, 150, 1),
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }

    /// @return Renvoi le design de chaque étiquette dans une liste
    List<Container> _buildAllChip() {
      List<Container> _chips = [];
      for (var i = 0; i < labels.length; i++) {
        _chips.add(_buildChip(labels[i]));
      }
      return _chips;
    }

    return FutureBuilder<Object>(
        future: widget.article.audio.isEmpty
            ? null
            : firebase_storage.FirebaseStorage.instance
                .ref()
                .child(widget.article.audio)
                .getDownloadURL(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Affiche Header
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ///Affiche button Favori
                        Center(
                          child: IconButton(
                            iconSize: 26,
                            color: Colors.white,
                            icon: Icon(
                              Icons.favorite_rounded,
                              color: widget.like ? Colors.red : Colors.black45,
                            ),
                            onPressed: () {
                              widget.changeFavorite(widget.idMaker);
                            },
                          ),
                        ),

                        ///Affiche Button 'Play'
                        if (!audioState && widget.article.audio.isNotEmpty)
                          Center(
                            child: IconButton(
                                iconSize: 26,
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  if (widget.article.audio.isNotEmpty)
                                    play(snapshot.data);
                                }),
                          ),

                        /// Affiche Button 'Stop'
                        if (audioState)
                          Center(
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(
                                Icons.stop,
                                color: Colors.red[400],
                              ),
                              // onPressed: stopPlayer,
                              onPressed: pausePlayer,
                            ),
                          ),
                        SizedBox(
                          width: 10,
                        ),

                        if (widget.article.text.isNotEmpty)
                          GestureDetector(
                              child:
                                  Container(width: 60, child: Text('FR/ENG')),
                              onTap: () => {
                                    setState(
                                      () {
                                        trad = !trad;
                                      },
                                    ),
                                  }),
                      ],
                    ),

                    ///Affiche button Commentaire
                    TextButton(
                      child: Row(
                        children: [
                          Text(
                            'DISCUSS',
                            style: TextStyle(
                                fontFamily: 'myriad',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromRGBO(209, 62, 150, 1)),
                          ),
                          Icon(
                            Icons.double_arrow_rounded,
                            color: Colors.black45,
                          )
                        ],
                      ),
                      onPressed: widget.switchToComm,
                    )
                  ],
                ),
                width: double.infinity,
                height: 40,
              ),

              /// Affiche Body
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Scrollbar(
                      child: GestureDetector(
                        onScaleUpdate: (ScaleUpdateDetails details) {
                          _pinch(details);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Affiche titre de l'article
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SelectableText(widget.article.title,
                                  style: TextStyle(
                                    fontFamily: 'myriad',
                                    color: Colors.black,
                                    fontSize: _sizeTitre,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),

                            // Affiche les mots cles
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Wrap(
                                spacing: 5,
                                children: _buildAllChip(),
                                runSpacing: 3,
                              ),
                            ),

                            /// Affiche les architectes
                            if (widget.article.architecte.isNotEmpty)
                              buildInfo(widget.article.architecte,
                                  'Architecte ', 'Architecte '),

                            /// Affiche les architectes associes
                            if (widget.article.associe.isNotEmpty)
                              buildInfo(widget.article.associe,
                                  'Architecte associé ', 'Architecte associé '),

                            /// Affiche les architecte transformation
                            if (widget.article.transformation.isNotEmpty)
                              buildInfo(
                                  widget.article.transformation,
                                  'Architecte transformation ',
                                  'Architecte transformation '),

                            /// Affiche les architecte des monuments historiques
                            if (widget.article.monument.isNotEmpty)
                              buildInfo(
                                  widget.article.monument,
                                  'Architecte des Monuments Historiques ',
                                  'Architecte des Monuments Historiques '),

                            /// Affiche les architectes de projet
                            if (widget.article.projet.isNotEmpty)
                              buildInfo(
                                  widget.article.projet,
                                  'Architecte de projet ',
                                  'Architect de projet '),

                            /// Affiche architecte local
                            if (widget.article.local.isNotEmpty)
                              buildInfo(widget.article.local,
                                  'Architecte local ', 'Architecte local '),

                            /// Affiche les architectes des opérations connexes
                            if (widget.article.operation.isNotEmpty)
                              buildInfo(
                                  widget.article.operation,
                                  'Architecte des opérations connexes ',
                                  'Architecte des opérations connexes '),

                            /// Affiche les architectes du patrimoine
                            if (widget.article.patrimoine.isNotEmpty)
                              buildInfo(
                                  widget.article.patrimoine,
                                  'Architecte du patrimoine ',
                                  'Architecte du patrimoine '),

                            /// Affiche le chef de projet
                            if (widget.article.chef.isNotEmpty)
                              buildInfo(widget.article.chef, 'Chef de projet ',
                                  'Chef de projet '),

                            /// Affiche l'ingenieur
                            if (widget.article.ingenieur.isNotEmpty)
                              buildInfo(widget.article.ingenieur, 'Ingénieur ',
                                  'Ingénieur '),

                            /// Affiche le paysagiste
                            if (widget.article.paysagiste.isNotEmpty)
                              buildInfo(widget.article.paysagiste,
                                  'Paysagiste ', 'Paysagiste '),

                            /// Affiche l'urbaniste
                            if (widget.article.urbaniste.isNotEmpty)
                              buildInfo(widget.article.urbaniste, 'Urbaniste ',
                                  'Urbaniste '),

                            /// Affiche l'artiste
                            if (widget.article.artiste.isNotEmpty)
                              buildInfo(widget.article.artiste, 'Artiste ',
                                  'Artiste '),

                            /// Affiche l'eclairagiste
                            if (widget.article.eclairagiste.isNotEmpty)
                              buildInfo(widget.article.eclairagiste,
                                  'Eclairagiste ', 'Eclairagiste '),

                            /// Affiche le conservateur du musée
                            if (widget.article.musee.isNotEmpty)
                              buildInfo(
                                  widget.article.musee,
                                  'Conservateur du musée ',
                                  'Conservateur du musée '),

                            /// Affiche le site
                            if (widget.article.lieu.isNotEmpty)
                              buildInfo(
                                  widget.article.lieu, 'Adresse ', 'Adresse '),

                            /// Affiche la date
                            if (widget.article.date.isNotEmpty)
                              buildInfo(
                                  widget.article.date, 'Année ', 'Année '),

                            /// Affiche l'année d'installation à Paris
                            if (widget.article.installation.isNotEmpty)
                              buildInfo(
                                  widget.article.installation,
                                  'Année d\'installation à Paris ',
                                  'Année d\'installation à Paris '),

                            /// Affiche les dimensions
                            if (widget.article.dimensions.isNotEmpty)
                              buildInfo(widget.article.dimensions,
                                  'Dimensions ', 'Dimensions '),

                            /// Affiche les Expositions
                            if (widget.article.expositions.isNotEmpty)
                              buildInfo(widget.article.expositions,
                                  'Expositions ', 'Expositions '),

                            /// Affiche la surface
                            if (widget.article.surface.isNotEmpty)
                              buildInfo(widget.article.surface, 'Surface ',
                                  'Surface '),

                            /// Affiche la surface à construire
                            if (widget.article.construire.isNotEmpty)
                              buildInfo(
                                  widget.article.construire,
                                  'Surface à construire ',
                                  'Surface à construire '),

                            /// Affiche la surface d'exposition
                            if (widget.article.surfaceExpo.isNotEmpty)
                              buildInfo(
                                  widget.article.surfaceExpo,
                                  'Surface d\'exposition ',
                                  'Surface d\'exposition '),
                            SizedBox(
                              height: 10,
                            ),

                            ///Affiche l'introduction de l'article
                            if (intro.length == 2)
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                margin: EdgeInsets.all(10),
                                child: SelectableText(
                                  intro[0],
                                  style: TextStyle(
                                    fontFamily: 'myriad',
                                    fontSize: _sizeIntro,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 20,
                            ),

                            Divider(
                              thickness: 2,
                              color: Colors.black54,
                              endIndent: 20,
                              indent: 20,
                            ),

                            ///Affiche la description de l'article
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    SelectableText(
                                      gras[0],
                                      style: TextStyle(
                                        fontFamily: 'myriad',
                                        fontSize: _sizeText,
                                      ),
                                    ),
                                    ...addBoldToText(),
                                    if (widget.article.text
                                        .contains('&signature'))
                                      Container(
                                        width: double.infinity,
                                        child: SelectableText(
                                          sign,
                                          style: TextStyle(
                                            fontFamily: 'myriad',
                                            fontSize: 13,
                                          ),
                                        ),
                                      )
                                  ],
                                )),

                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  // info Information à afficher
  // fr texte en français
  // eng texte en anglais
  Container buildInfo(info, fr, eng) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SelectableText.rich(TextSpan(
          text: trad ? eng : fr,
          style: TextStyle(
            fontFamily: 'myriad',
            fontSize: _sizeInfo,
            color: Colors.black,
          ),
          children: [
            TextSpan(
                text: info,
                style: TextStyle(
                    fontFamily: 'myriad',
                    fontSize: _sizeInfo,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))
          ])),
    );
  }
}
