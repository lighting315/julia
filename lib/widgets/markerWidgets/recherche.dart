import '../../models/article.dart';
import '../../models/tag.dart';
import '../../providers/articleProvider.dart';
import '../../providers/tagProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recherche extends StatefulWidget {
  const Recherche({Key key, this.showMap, this.filterMap}) : super(key: key);

  /// Ferme la fenetre 'liste des favoris'
  final Function showMap;

  /// Filtrer la map
  final Function filterMap;

  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  final _titleController = TextEditingController();

  /// Liste
  List<Tag> _listChip = [];

  ///Liste des articles à afficher
  List<Article> _articles = [];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tagsData = Provider.of<TagProvider>(context);
    final articlesData = Provider.of<ArticleProvider>(context, listen: false);

    /// List des étiquettes sélectionnées
    final List<Tag> _isVisible = tagsData.listVisible();

    /// @rgs - item Etiquette à afficher
    /// @return Renvoi le widget d'une étiquette
    Widget _buildChip(Tag item) {
      return GestureDetector(
        onTap: () {
          setState(() {
            item.isVisible = !item.isVisible;
            if (item.isVisible)
              _isVisible.contains(item)
                  ? _isVisible.remove(item)
                  : _isVisible.add(item);
          });
        },
        child: Container(
          child: Text(
            item.label,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: item.isVisible
                ? Color.fromRGBO(209, 62, 150, 1)
                : Colors.brown[100],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    }

    /// Change la liste des étiquettes filtrée par la recherche
    void _onChanged() {
      String label = '';
      List<Tag> _buffer = [];
      _listChip.clear();
      for (var i = 0; i < tagsData.tags.length; i++) {
        label = tagsData.tags[i].label;
        if (label.toLowerCase().contains(_titleController.text.toLowerCase()))
          _buffer.add(tagsData.tags[i]);
      }
      setState(() {
        _listChip = _buffer;
      });
    }

    /// @return Renvoi le design de chaque étiquette dans une liste
    List<GestureDetector> _buildAllChip() {
      List<GestureDetector> _chips = [];
      if (_listChip.isEmpty)
        for (var i = 0; i < tagsData.tags.length; i++) {
          _chips.add(_buildChip(tagsData.tags[i]));
        }
      else
        for (var i = 0; i < _listChip.length; i++) {
          _chips.add(_buildChip(_listChip[i]));
        }
      return _chips;
    }

    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            widget.showMap();
          },
          child: Container(
            color: Colors.black38,
          ),
        )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              /// Header
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350],
                ),
                height: 40,
                width: MediaQuery.of(context).size.width,
                child:

                    ///Barre de recherche
                    Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black54,
                    )),

                    /// INPUT
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 17, 0, 0),
                        child: TextField(
                          maxLines: 1,
                          cursorHeight: 20,
                          cursorColor: Colors.black26,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Mots-clefs',
                              hintStyle: TextStyle(fontSize: 17),
                              disabledBorder: InputBorder.none),
                          controller: _titleController,
                          onChanged: (_) => _onChanged(),
                          // onSubmitted: (_) => _onSubmitted(),
                        ),
                        width: 130,
                      ),
                    ),

                    ///Button 'CLOSE'
                    Container(
                      width: 30,
                      child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 23,
                            color: Colors.black54,
                          ),
                          onPressed: () => {
                                setState(() {
                                  _listChip.clear();
                                  _titleController.clear();
                                })
                              }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// Button 'Afficher sur la map'
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 2),
                      width: 190,
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Afficher sur la carte',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'myriad'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.map,
                              color: Colors.lightGreen[800],
                              size: 25,
                            )
                          ],
                        ),
                        onPressed: () {
                          if (_isVisible.isNotEmpty) {
                            _articles = articlesData.articlesFilter(_isVisible);
                          } else {
                            _articles = [...articlesData.articles];
                          }
                          widget.filterMap(_articles, true);
                        },
                      ),
                      height: 50,
                    ),

                    /// Button 'Tout deselectionner'
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 0, 5),
                      width: 190,
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Tout désélectionner',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'myriad'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.close,
                              size: 27,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        onPressed: () {
                          _articles = [...articlesData.articles];
                          tagsData.isNotVisibleAll();
                          widget.filterMap(_articles, false);
                        },
                      ),
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),

              /// List chips
              Expanded(
                child: SingleChildScrollView(
                  child: _titleController.text.isNotEmpty && _listChip.isEmpty
                      ? Container(
                          height: 300,
                          width: 200,
                          child: Center(
                            child: Text(
                              'Aucun résultat!',
                              style: TextStyle(
                                  fontFamily: 'myriad',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Wrap(
                                spacing: 10,
                                children: _buildAllChip(),
                                runSpacing: 8,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
          color: Colors.white,
        ),
      ]),
    );
  }
}
