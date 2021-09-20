import '../../providers/favoriteProvider.dart';
import 'favoriItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Represente la fenetre 'liste des favoris'
class ListFavoris extends StatefulWidget {
  /// Afficher l'article
  final Function afficherArticle;

  /// Ferme la fenetre 'liste des favoris'
  final Function showMap;

  /// Centre la carte sur le marqueur
  final Function centerMarker;

  const ListFavoris({this.afficherArticle, this.showMap, this.centerMarker});

  @override
  State<StatefulWidget> createState() {
    return new ListFavorisState();
  }
}

class ListFavorisState extends State<ListFavoris> {

  @override
  Widget build(BuildContext context) {
    /// Liste des marquers avec l'attribut isFavorite à true
    final articleList =
        Provider.of<FavoriteProvider>(context).markers.reversed.toList();

    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              widget.showMap();
            },
            child: Container(
              color: Colors.black38,
            ),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.85,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Header
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.favorite,
                            size: 17,
                            color: Colors.red,
                          )),
                      Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Lieux sauvegardés',
                            style: TextStyle(fontFamily: 'myriad'),
                          ))
                    ],
                  ),
                ),

                /// Body
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                        itemCount: articleList.length,
                        itemBuilder: (ctx, index) => Column(
                              children: [
                                FavoriItem(
                                  afficherArticle: widget.afficherArticle,
                                  marker: articleList[index],
                                  centerMarker: widget.centerMarker,
                                ),
                                Divider(
                                  color: Colors.black26,
                                  height: 4,
                                  endIndent: 40,
                                  indent: 40,
                                  thickness: 1,
                                )
                              ],
                            )),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
                // ),
              ],
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
