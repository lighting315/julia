import '../../providers/favoriteProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../crypt/encrypt.dart';
import '../../models/User.dart';
import '../carteScreen.dart';
import '../../utilities/constants.dart';
import 'SignScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

///Permet d'afficher la fenêtre de connexion
class LoginScreen extends StatefulWidget {
  static const routeName = '/Login.dart';
  const LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  /// indique si l'utilisateur appuie sur le bouton traduction
  bool trad = true;

  ///false si l'utilisateur veut voir son password
  bool _isSecret = true;

  /// indique si l'utilisateur appuie sur le bouton se souvenir de moi
  bool _rememberMe = false;

  /// initialisation des variables
  String _email = '', _password = '';

  /// authentification de l'utilisateur
  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential userC = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        if (!userC.user.emailVerified) {
          print('Snack');

          final snackBar = SnackBar(
            content: Text('Email non validé!'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          FirebaseFirestore.instance
              .collection('utilisateur')
              .doc(userC.user.uid)
              .update({'password': encrypt(_password)});
          UserCustom userCustom;

          FirebaseFirestore.instance.collection('utilisateur').get().then(
              (QuerySnapshot querySnapshot) => querySnapshot.docs
                      .forEach((QueryDocumentSnapshot element) async {
                    if (element.id == userC.user.uid) {
                      var x = element.get('favoris');
                      List<String> listFav = [...x];
                      userCustom = UserCustom(
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

                      Provider.of<FavoriteProvider>(context, listen: false)
                          .clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CarteScreen(auth: true, user: userCustom)),
                      );
                    }
                  }));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          final snackBar = _buildSnackBar('L\'adresse mail est invalide');
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (e.code == 'wrong-password') {
          final snackBar = _buildSnackBar('Le mot de passe est incorrect');
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
  }

  Widget _buildSnackBar(String texte) {
    return SnackBar(
      elevation: 6.0,
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Text(texte, style: TextStyle(color: Colors.white, fontSize: 16)),
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  ///affichage du formulaire pour saisir le mail
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            validator: (input) => !input.contains('@') || input.isEmpty
                ? trad
                    ? 'Votre email est invalide'
                    : 'Your email is invalid'
                : null,
            onSaved: (input) => _email = input,
            controller: myController,
            onChanged: (input) {
              setState(() {
                _email = myController.text;
              });
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'myriad',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: 'Ex: john.doe@domain.tld',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  ///affichage du formulaire pour saisir le mot de passe
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          trad ? 'Mot de Passe' : 'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            obscureText: _isSecret,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'myriad',
            ),
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () => setState(() => _isSecret = !_isSecret),
                child:
                    Icon(!_isSecret ? Icons.visibility : Icons.visibility_off),
              ),
              contentPadding: EdgeInsets.all(14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: 'Ex: gh!D4Yhd',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value) => setState(() => _password = value),
            validator: (input) => input.length < 6
                ? trad
                    ? 'Entrer un mot de passe avec 6 caractères minimum.'
                    : 'Enter a password with a minimum of 6 characters. '
                : null,
            onSaved: (input) => _password = input,
          ),
        ),
      ],
    );
  }

  ///affichage du formulaire de saisie du mot de passe
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          FirebaseAuth.instance
              .sendPasswordResetEmail(email: _email)
              .then((value) => null);
          final snackBar = SnackBar(
            backgroundColor: Color.fromRGBO(209, 62, 150, 1),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Text(
                'Un email a été envoyé à l\'adresse e-mail mentionné ci-dessus.',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            action: SnackBarAction(
              label: 'Ok',
              textColor: Colors.white,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text(
          trad ? 'Mot de passe oublié?' : 'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  ///affichage d'une case à cocher laissant le choix à l'utilisateur de choisir s'il veut que l'appli se souvient de son mot de passe et son login
  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(209, 62, 150, 1), width: 2)),
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,

                checkColor: Color.fromRGBO(209, 62, 150, 1),
                // activeColor: Color.fromRGBO(209, 62, 150, 1),
                activeColor: Colors.white,

                onChanged: (value) async {
                  setState(() {
                    _rememberMe = value;
                  });

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('email', _email);
                  prefs.setString('password', _password);
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            trad ? 'Se souvenir de moi' : 'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  /// affichage du mot de passe se connecter
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 5,
            padding: EdgeInsets.all(15.0),
          ),
          child: Text(
            trad ? 'SE CONNECTER' : 'LOG IN',
            style: TextStyle(
              color: Color.fromRGBO(209, 62, 150, 1),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'myriad',
            ),
          ),
          onPressed: () async {
            _submit();
          }),
    );
  }

  ///Permettre à l'utilisateur de s'inscrire s'il ne possède pas de compte
  Widget _buildSignupBtn() {
    return GestureDetector(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: trad
                    ? "Vous n\'avez pas de compte? \n"
                    : 'You don\'t have an account? \n',
                style: TextStyle(
                  color: Color.fromRGBO(209, 62, 150, 1),
                  fontSize: 18.0,
                  fontFamily: 'myriad',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: trad ? 'Inscrivez-vous' : 'Create new account',
                style: TextStyle(
                  color: Color.fromRGBO(209, 62, 150, 1),
                  fontFamily: 'myriad',
                  fontSize: 18.0,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {});
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignScreen()),
          );
        });
  }

  /// affichage de la page de connexion avec les différents composants
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        //toolbarHeight: 100,
        leading: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.black45,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              trad ? 'FR' : 'ENG',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            onPressed: () {
              setState(() {
                trad = !trad;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top + kToolbarHeight),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    trad ? 'Connexion' : 'Log in',
                    style: TextStyle(
                      color: Color.fromRGBO(209, 62, 150, 1),
                      fontFamily: 'myriade',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Form(
                    key: _formKey,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            decoration: kBoxDecorationStyle,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 25.0,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                _buildEmailTF(),
                                SizedBox(
                                  height: 30.0,
                                ),
                                _buildPasswordTF(),
                                _buildForgotPasswordBtn(),
                                _buildRememberMeCheckbox(),
                                _buildLoginBtn(),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20.0),
                  _buildSignupBtn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
