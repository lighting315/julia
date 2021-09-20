import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/User.dart';
import 'authentificationScreen/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/tagProvider.dart';
import '../widgets/commentaireWidgets/fenetreArticleCom.dart';
import '../widgets/markerWidgets/balise.dart';
import '../models/article.dart';
import '../models/customMarker.dart';
import '../providers/articleProvider.dart';
import '../providers/favoriteProvider.dart';
import '../providers/markerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../widgets/favorisWidgets/listeFavoris.dart';
import '../widgets/markerWidgets/recherche.dart';
import '../widgets/drawer.dart';

class CarteScreen extends StatefulWidget {
  final bool auth;

  final User login;

  final UserCustom user;

  const CarteScreen({Key key, this.user, this.auth, this.login})
      : super(key: key);

  @override
  _CarteScreenState createState() => _CarteScreenState();
}

class _CarteScreenState extends State<CarteScreen> {
  /// Identifiant de l'article à ouvrir
  String _idArticle;

  /// Etat de la fenetre Favori
  bool _favorisVisible = false;

  /// Etat de la fenetre Recherche
  bool _rechercheVisible = false;

  /// Donnée de la position courant de l'utilisateur
  LocationData _currentLocation;

  /// Statut des permissions
  PermissionStatus _permissionGranted;

  /// List des marquers filtrés à afficher
  List<CustomMarker> _markersFiltered = [];

  /// Verifie si c'est la premiere fois que le widget est build
  bool firstRun = true;

  /// Indique s'il on fait directement la transition entre deux articles
  bool _switchArticle = false;

  /// Position initiale de la map
  LatLng centerMap = LatLng(48.85952489020911, 2.3406119299690786);

  /// Position d'un article
  double _position = (window.physicalSize.height / window.devicePixelRatio) -
      200 -
      kBottomNavigationBarHeight;

  bool _serviceEnabled;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final MapController mapController = MapController();

  /// Zoom de la map
  double zoomMap = 13.5;

  bool isInit = false;

  UserCustom user;

  @override
  void initState() {
    super.initState();
    _getCurrentUserLocation();

    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await Provider.of<ArticleProvider>(context, listen: false)
          .fetchAndSetArticle();
      Provider.of<MarkerProvider>(context, listen: false).fetchAndSetMarker();
      Provider.of<TagProvider>(context, listen: false).fetchAndSetTag();

      if (widget.login != null) {
        await FirebaseFirestore.instance.collection('utilisateur').get().then(
            (QuerySnapshot querySnapshot) => querySnapshot.docs
                    .forEach((QueryDocumentSnapshot element) async {
                  if (element.id == widget.login.uid) {
                    var x = element.get('favoris');
                    List<String> listFav = [...x];
                    user = UserCustom(
                      id: element.id,
                      nom: element.get('name'),
                      prenom: element.get('prenom'),
                      eMail: element.get('eMail'),
                      phone: element.get('phone'),
                      dateNaissance: element.get('dateNaissance'),
                      passeword: element.get('password'),
                      sexe: element.get('sexe'),
                      favoris: listFav,
                      isAdmin: element.get('isAdmin'),
                    );
                  }
                }));
      } else {
        user = widget.user;
      }

      if (widget.auth) {
        Provider.of<FavoriteProvider>(context, listen: false)
            .fetchAndSetFavoris();
      }
    });
  }

  Future<void> _getCurrentUserLocation() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = currentLocation;
      });
    });
  }

  /// permet d'indiquer si l'on est passé d'un article à un autre
  void _setSwitchFalse() {
    _switchArticle = false;
  }

  /// Ferme les fenetres 'list des favoris' et 'recherche'
  void _showMap() {
    setState(() {
      _favorisVisible = false;
      _rechercheVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final markersData = Provider.of<MarkerProvider>(context);
    final favoriteData = Provider.of<FavoriteProvider>(context);
    final _height = MediaQuery.of(context).size.height;

    /// Liste des markers (id) en favori de l'utilisateur
    List<String> listeUserFavori;

    if (widget.auth) {
      listeUserFavori = [...favoriteData.favoris];
    }

    /// @args - id Identifiant d'un marqueur
    /// Change l'etat 'isFavorite' d'un marker
    void changeFavorite(String id) {
      CustomMarker _marker =
          markersData.markers.firstWhere((item) => item.id == id);
      if (_marker.isFavorite) {
        markersData.unfavorite(id);
        favoriteData.delete(_marker.id, _marker);
      } else {
        markersData.favorite(id);
        favoriteData.add(_marker);
        favoriteData.addFavoris(_marker.id);

        FirebaseFirestore.instance.collection('/utilisateur').doc(user.id).set({
          'name': user.nom,
          'prenom': user.prenom,
          'sexe': user.sexe,
          'phone': user.phone,
          'eMail': user.eMail,
          'dateNaissance': user.dateNaissance,
          'password': user.passeword,
          'favoris': favoriteData.favoris,
          'isAdmin': user.isAdmin,
        });
      }
    }

    // Initialise le visuelle des markers favoris

    if (widget.auth) {
      listeUserFavori.forEach((element) {
        CustomMarker _marker =
            markersData.markers.firstWhere((item) => item.id == element);
        _marker.isFavorite = true;
      });
    }
    if (_permissionGranted == PermissionStatus.granted &&
        _currentLocation != null &&
        firstRun == true) {
      setState(() {
        firstRun = false;
      });
    }

    // Ferme l'article si la fenêtre est totalement caché
    if (_position == _height) {
      setState(() {
        _position = _height - 200 - kBottomNavigationBarHeight;

        _idArticle = null;
        markersData.resetAllMarker();
      });
    }

    /// @args details Donnée du mouvement d'un pointer
    /// Change la position de l'article
    void _slide(DragUpdateDetails details) {
      setState(() {
        _position += details.delta.dy * 1.5;
      });
    }

    /// @args la nouvelle position de l'article
    /// permet de modifier la position de l'article
    void _setPosition(double pos) {
      _position = pos;
    }

    /// Ouvre un article
    void openMarker(CustomMarker item) {
      setState(() {
        if (widget.auth) {
          _position = _height - 200 - kBottomNavigationBarHeight;
          markersData.resetMarker(item);
          item.isVisible = !item.isVisible;

          if (_idArticle != null) {
            if (markersData.markerOpen()) {
              _idArticle = item.idArticle;
              _switchArticle = true;
            } else
              _idArticle = null;
          } else
            _idArticle = item.idArticle;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      });
    }

    if (_idArticle == null) {
      setState(() {
        _switchArticle = false;
      });
    }

    /// Représente toutes les balises
    final balises = Balise(
        context: context,
        markersFiltered: _markersFiltered,
        zoomMap: zoomMap,
        openMarker: openMarker,
        rotation: mapController.ready ? this.mapController.rotation : 0);

    /// @args - articles Liste d'article
    /// Affiche la carte avec les marqueurs filtrés
    void filterMap(List<Article> articles, bool afficher) {
      if (articles.isEmpty) {
        return;
      }
      setState(() {
        if (afficher) {
          _favorisVisible = false;
          _rechercheVisible = false;
        }
        _markersFiltered = markersData.markersFilter(articles);
      });
    }

    /// @args - marker marqueur
    /// Affiche l'article sélectionné depuis la liste des favoris
    void _afficherArticle(CustomMarker marker) {
      setState(() {
        _favorisVisible = false;
        _rechercheVisible = false;
        _idArticle = marker.idArticle;
        _position = 1;
        marker.isVisible = true;

        mapController.moveAndRotate(
            LatLng(marker.latitude, marker.longitude), 17, 0);
      });
    }

    /// @args - marker marqueur
    /// Affiche l'article sélectionné depuis la liste des favoris
    void _centerMarker(CustomMarker marker) {
      setState(() {
        _favorisVisible = false;
        _rechercheVisible = false;
        mapController.moveAndRotate(
            LatLng(marker.latitude, marker.longitude), 17, 0);
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: DrawerCustom(auth: widget.auth, user: user),
      body: SafeArea(
        child: Stack(
          children: [
            //Affiche la map
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                onTap: (_) {
                  setState(() {
                    _position = _height;
                  });
                },
                onPositionChanged: (map, x) {
                  if (x) {
                    setState(() {
                      zoomMap = map.zoom;
                    });
                  }
                },
                center: centerMap,
                zoom: 12.0,
                maxZoom: 19.0,
                minZoom: 4.2,
              ),
              layers: [
                TileLayerOptions(
                    maxZoom: 19.0,
                    maxNativeZoom: 19.0,
                    urlTemplate:
                        "https://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",
                    subdomains: ['mt0', 'mt1', 'mt2', 'mt3']),
                MarkerLayerOptions(
                  markers: [
                    ///Affiche tous les marqueurs
                    ...balises.buildAllMarker(),

                    ///Affiche l'utilisateur
                    if (_currentLocation != null)
                      Marker(
                          width: 35.0,
                          height: 35.0,
                          point: LatLng(_currentLocation.latitude,
                              _currentLocation.longitude),
                          builder: (ctx) => Image(
                              image:
                                  AssetImage('assets/images/utilisateur.png'))),
                  ],
                ),
              ],
            ),

            ///Affiche le bouton Drawer
            Positioned(
              left: 15,
              top: 15,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),

            ///Affiche le bouton Favori
            Positioned(
              right: 155,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _idArticle = null;
                    _rechercheVisible = false;
                    _favorisVisible = !_favorisVisible;
                    markersData.resetAllMarker();
                  });
                },
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/icones/favori.png'),
                    )),
              ),
            ),

            ///Affiche le bouton Recherche
            Positioned(
              right: 85,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _idArticle = null;
                    _favorisVisible = false;
                    _rechercheVisible = !_rechercheVisible;
                    markersData.resetAllMarker();
                  });
                },
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/icones/recherche.png'),
                    )),
              ),
            ),

            ///Affiche le bouton Centrer
            Positioned(
              right: 15,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  mapController.rotate(0);
                  setState(() {});
                },
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/icones/nord.png'),
                    )),
              ),
            ),

            ///Affiche l'article
            if (_idArticle != null)
              Consumer<ArticleProvider>(
                builder: (_, articlesData, child) => FenetreArticleCom(
                  user: user,
                  auth: widget.auth,
                  position: _position,
                  slide: _slide,
                  article: articlesData.markerToArticle(_idArticle),
                  changeFavorite: changeFavorite,
                  idMaker: markersData.markers
                      .firstWhere((data) => data.idArticle == _idArticle)
                      .id,
                  like: markersData.markers
                      .firstWhere((data) => data.idArticle == _idArticle)
                      .isFavorite,
                  setPosition: _setPosition,
                  switchArticle: _switchArticle,
                  switchFalse: _setSwitchFalse,
                ),
              ),

            ///Affiche la liste des favoris
            if (_favorisVisible)
              ListFavoris(
                afficherArticle: _afficherArticle,
                showMap: _showMap,
                centerMarker: _centerMarker,
              ),

            ///Affiche les recherches
            if (_rechercheVisible)
              Recherche(
                showMap: _showMap,
                filterMap: filterMap,
              ),
          ],
        ),
      ),
    );
  }
}
