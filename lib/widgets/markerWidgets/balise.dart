import '../../models/customMarker.dart';
import '../../providers/articleProvider.dart';
import '../../providers/markerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Balise {
  final BuildContext context;

  /// Valeur du zoom de la map
  final double zoomMap;

  /// Liste de marker filtré
  final List<CustomMarker> markersFiltered;

  /// Permet d''ouvrir un article
  final Function openMarker;

  /// Degré de rotation de la map
  final double rotation;

  const Balise(
      {this.context,
      this.markersFiltered,
      this.zoomMap,
      this.openMarker,
      this.rotation = 0});

  /// @args - item marqueur
  /// @return Renvoie l'image du marqueur
  Widget _imageMarker(CustomMarker item, String type) {
    final article = Provider.of<ArticleProvider>(context, listen: false)
        .markerToArticle(item.idArticle);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Text(
              article.title,
              style: TextStyle(
                fontFamily: 'myriad',
                fontSize: 23,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )),
          GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Container(
                child: Image(
              height: 40,
              width: 40,
              image: AssetImage('assets/images/marker/$type.png'),
            )),
          )
        ],
      ),
    );
  }

  Widget _mainImage(CustomMarker item) {
    final article = Provider.of<ArticleProvider>(context, listen: false)
        .markerToArticle(item.idArticle);

    if (article.text.isNotEmpty && item.isFavorite == false && item.isVisible) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletSélectionné');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage(
                  'assets/images/marker/marqueurVioletSélectionné.png'),
            ));
    } else if (article.text.isEmpty &&
        item.isFavorite == false &&
        item.isVisible) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletFoncéSélectionné');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage(
                  'assets/images/marker/marqueurVioletFoncéSélectionné.png'),
            ));
    } else if (article.text.isEmpty && item.isFavorite && item.isVisible) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletFoncéSélectionnéCoeur');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage(
                  'assets/images/marker/marqueurVioletFoncéSélectionnéCoeur.png'),
            ));
    } else if (article.text.isNotEmpty && item.isFavorite && item.isVisible) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletSélectionnéCoeur');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage(
                  'assets/images/marker/marqueurVioletSélectionnéCoeur.png'),
            ));
    } else if (article.text.isEmpty && item.isFavorite == false) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletFoncé');
      else
        return GestureDetector(
          onTap: () {
            openMarker(item);
          },
          child: Image(
            height: 40,
            width: 40,
            image: AssetImage('assets/images/marker/marqueurVioletFoncé.png'),
          ),
        );
    } else if (article.text.isEmpty && item.isFavorite) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletFoncéCoeur');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage('assets/images/marker/marqueurVioletFoncéCoeur.png'),
            ));
    } else if (article.text.isNotEmpty && item.isFavorite == false) {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurViolet');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image: AssetImage('assets/images/marker/marqueurViolet.png'),
            ));
    } else {
      if (zoomMap > 15.5)
        return _imageMarker(item, 'marqueurVioletFavori');
      else
        return GestureDetector(
            onTap: () {
              openMarker(item);
            },
            child: Image(
              height: 40,
              width: 40,
              image:
                  AssetImage('assets/images/marker/marqueurVioletFavori.png'),
            ));
    }
  }

  /// @args - item marqueur
  /// @return Renvoie le design d'un marker
  Marker _buildMarker(CustomMarker item) {
    return Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: zoomMap > 15.5 ? 180 : 40,
        height: zoomMap > 15.5 ? 120 : 40,
        point: LatLng(item.latitude, item.longitude),
        builder: (ctx) => Transform.rotate(
              angle: -rotation * math.pi / 180,
              alignment: Alignment.bottomCenter,
              child: _mainImage(item),
            ));
  }

  /// @return Renvoie le design de tous les markers
  List<Marker> buildAllMarker() {
    List<Marker> _markers = [];

    final markersData = Provider.of<MarkerProvider>(context);

    if (markersFiltered.isEmpty)
      for (var i = 0; i < markersData.markers.length; i++) {
        _markers.add(_buildMarker(markersData.markers[i]));
      }
    else
      for (var i = 0; i < markersFiltered.length; i++) {
        _markers.add(_buildMarker(markersFiltered[i]));
      }

    return _markers;
  }
}
