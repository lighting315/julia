import '../../models/customMarker.dart';
import '../../providers/articleProvider.dart';
import '../../providers/favoriteProvider.dart';
import '../../providers/markerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriItem extends StatelessWidget {
  const FavoriItem(
      {@required this.afficherArticle,
      @required this.marker,
      @required this.centerMarker});

  /// afficher l'article
  final Function afficherArticle;

  /// marqueur avec isFavorite égale à true
  final CustomMarker marker;

  /// centre la carte sur le marqueur
  final Function centerMarker;

  @override
  Widget build(BuildContext context) {
    final articlesData = Provider.of<ArticleProvider>(context, listen: false);

    /// @return Renvoi le titre de l'article
    String getTitle() {
      return articlesData.markerToArticle(marker.idArticle).title;
    }

    /// @return Renvoi la description de l'article
    String getDescription() {
      return articlesData.markerToArticle(marker.idArticle).text;
    }

    /// @return Renvoi l'architecte titre de l'article
    String getArchitecte() {
      return articlesData.markerToArticle(marker.idArticle).architecte;
    }

    /// @return Renvoi le paysagiste titre de l'article
    String getPaysagiste() {
      return articlesData.markerToArticle(marker.idArticle).paysagiste;
    }

    /// @return Renvoi l'artiste titre de l'article
    String getArtiste() {
      return articlesData.markerToArticle(marker.idArticle).artiste;
    }

    /// @return Renvoi l'info selon la priorité
    String getFavori() {
      if (getArchitecte().isNotEmpty) {
        return getArchitecte();
      } else {
        if (getPaysagiste().isNotEmpty)
          return getPaysagiste();
        else {
          return getArtiste();
        }
      }
    }

    /// @return Renvoi la date de l'article
    String getDate() {
      return articlesData.markerToArticle(marker.idArticle).date;
    }

    return ClipRect(
      child: Dismissible(
        key: ValueKey(marker.id),
        onDismissed: (direction) {
          Provider.of<MarkerProvider>(context, listen: false)
              .unfavorite(marker.id);
          Provider.of<FavoriteProvider>(context, listen: false)
              .delete(marker.id, marker);
        },
        direction: DismissDirection.endToStart,
        background: Container(
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
          color: Colors.red[400],
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(20),
        ),
        child: Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
              width: 40,
              child:
              Image(
              height: 40,
              width: 40,
              image: AssetImage(
                  getDescription().isNotEmpty?'assets/images/marker/marqueurViolet.png':'assets/images/marker/marqueurVioletFoncé.png'),
            ), 
              // Icon(
              //   Icons.room_rounded,
              //   color: getDescription().isNotEmpty
              //       ? Color.fromRGBO(209, 62, 150, 1)
              //       : Color.fromRGBO(45, 198, 242, 1),
              //   size: 35,
              // ),
            ),
            Expanded(
              child: Container(
                  height: 160,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            getTitle(),
                            style: TextStyle(
                              fontFamily: 'myriad',
                              fontSize: 21,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            getFavori(),
                            style: TextStyle(
                                fontFamily: 'myriad',
                                color: Colors.black54,
                                fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            getDate(),
                            style: TextStyle(
                                fontFamily: 'myriad',
                                color: Colors.black54,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                          height: 40,
                          width: double.infinity,
                          child: IntrinsicHeight(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        centerMarker(marker);
                                      },
                                      child: Text(
                                        'voir la carte',
                                        style: TextStyle(
                                            fontFamily: 'myriad',
                                            color:
                                                Color.fromRGBO(209, 62, 150, 1),
                                            fontSize: 15),
                                      )),
                                  VerticalDivider(
                                    color: Colors.black45,
                                    thickness: 1,
                                    endIndent: 10,
                                    indent: 10,
                                    width: 1,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        afficherArticle(marker);
                                      },
                                      child: Text(
                                        'voir la fiche',
                                        style: TextStyle(
                                            fontFamily: 'myriad',
                                            color:
                                                Color.fromRGBO(209, 62, 150, 1),
                                            fontSize: 15),
                                      )),
                                ]),
                          )),
                    ],
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
