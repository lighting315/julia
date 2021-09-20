import 'package:aura2/providers/favoriteProvider.dart';
import 'package:provider/provider.dart';

import '../screens/drawerScreens/politiqueScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/User.dart';
import '../screens/authentificationScreen/Compte.dart';

import '../screens/drawerScreens/aProposScreen.dart';
import '../screens/drawerScreens/conditionScreen.dart';
import '../screens/drawerScreens/contacterScreen.dart';
import '../screens/homeScreen.dart';

import '../screens/authentificationScreen/LoginScreen.dart';

import 'package:flutter/material.dart';
import '../screens/authentificationScreen/SignScreen.dart';

class DrawerCustom extends StatefulWidget {
  /// indique si y a un utilisateur connecté
  final bool auth;

  /// l'utilisateur courrant
  final UserCustom user;
  const DrawerCustom({Key key, this.auth, this.user}) : super(key: key);
  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

/// affiche les différents champs du drawer
class _DrawerCustomState extends State<DrawerCustom> {
  Widget _buildDrawer(BuildContext ctx, String title, String screen) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'Myriade'),
        ),
        onTap: () {
          if (screen == '')
            Navigator.pop(ctx);
          else
            Navigator.popAndPushNamed(ctx, screen);
        },
      ),
    );
  }

  /// affichage de la fenetre mon compte permettant de modifier les informations de l'utilisateur
  Widget _buildCompte(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: ListTile(
        title: Text(
          'Mon Compte',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'myriad'),
        ),
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) => Compte(user: widget.user)),
          );
        },
      ),
    );
  }

  /// affichage du message de confirmation de  la déconnexion
  /// l'utilisateur peut confirmer ou annuler
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text(
        "Se déconnecter",
        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Myriade'),
      ),
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(Color(0xFFce3f8f)),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFce3f8f)),
      ),
      onPressed: () {
        FirebaseAuth.instance.signOut();

        Provider.of<FavoriteProvider>(context,listen: false).clear();

        Navigator.pushNamed(context, HomeScreen.routeName);
      },
    );

    Widget continueButton = ElevatedButton(
      child: Text(
        "Annuler",
        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Myriade'),
      ),
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(Color(0xFFce3f8f)),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFce3f8f)),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Container(
        child: Column(
          children: [
            Icon(
              Icons.power_settings_new,
              color: Color(0xFFce3f8f),
              size: 40,
            ),
            Text(
              'Déconnexion',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFce3f8f),
                fontFamily: 'Myriade',
              ),
            ),
          ],
        ),
      ),
      content: Text(
        "Êtes-vous sûr de vouloir vous déconnecter ?",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Myriade',
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /// permet de tracer une ligne
  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Divider(
        color: Colors.grey[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool auth = widget.auth;
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo_aura_violet.png'),
                    width: 30,
                  ),
                  Text(
                    'AURA',
                    style: TextStyle(fontSize: 24, fontFamily: 'myriad'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if (auth == true) ...[
              _buildCompte(context),
              _buildDivider(),
            ] else ...[
              _buildDrawer(context, 'Se connecter', LoginScreen.routeName),
              _buildDivider(),
              _buildDrawer(context, 'S\'inscrire', SignScreen.routeName),
              _buildDivider(),
            ],
            _buildDrawer(context, 'A propos de nous', AProposScreen.routeName),
            _buildDivider(),
            _buildDrawer(context, 'Nous contacter', ContacterScreen.routeName),
            _buildDivider(),
            _buildDrawer(context, 'Conditions générales d\'utilisation',
                ConditionScreen.routeName),
            _buildDivider(),
            _buildDrawer(context, 'Politique de confidentialité',
                PolitiqueScreen.routeName),
            _buildDivider(),
            if (auth) ...[
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: ListTile(
                  title: Text(
                    'Déconnexion',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'myriad'),
                  ),
                  onTap: () {
                    showAlertDialog(context);
                  },
                ),
              ),
              _buildDivider(),
            ],
          ],
        ),
      ),
    );
  }
}
