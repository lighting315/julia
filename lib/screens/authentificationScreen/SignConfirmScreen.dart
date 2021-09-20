import '../../providers/favoriteProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../crypt/encrypt.dart';
import '../../models/screenArgument.dart';
import 'LoginScreen.dart';
import 'SignScreen.dart';
import '../../utilities/LinkedLabeLRadio.dart';
import 'ConditionsInscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utilities/constants.dart';

/// Deuxième fenêtre d'inscription avec (nom, prenom, numéro de téléphone, ...)
class SignConfirmScreen extends StatefulWidget {
  static const routeName = '/SignConfirm.dart';

  /// Email de l'utilisateur
  final String email;

  /// Mot de passe de l'utilisateur
  final String password;

  const SignConfirmScreen({this.email, this.password});
  @override
  _SignConfirmScreenState createState() => _SignConfirmScreenState();
}

class _SignConfirmScreenState extends State<SignConfirmScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isRadioSelected = false;
  Color _color = Colors.black45;
  TextDecoration _deco = TextDecoration.none;

  /// initialisation de la variable nom de l'utilisateur
  String _nom = '';

  /// initialisation de la variable prenom de l'utilisateur
  String _prenom = '';

  /// initialisation de la variable date de naissance de l'utilisateur
  String _date = '';

  /// initialisation de la variable sexe de l'utilisateur
  String _sexe = 'Homme';

  /// initialisation de la variable numéro de téléphone de l'utilisateur
  String _phone;

  SignScreenState screenState = new SignScreenState();

  /// Inscrription de l'utilisateur
  /// ajout de l'utilisateur dans la base de données
  _submit(ScreenArgument arg) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      UserCredential authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: arg.email,
        password: arg.password,
      );
      User signedInUser = authResult.user;

      try {
        await signedInUser.sendEmailVerification();
      } catch (e) {
        print("An error occured while trying to send email  verification");
        print(e.message);
      }

      if (signedInUser != null) {
        FirebaseFirestore.instance
            .collection('/utilisateur')
            .doc(signedInUser.uid)
            .set({
          'name': _nom,
          'prenom': _prenom,
          'dateNaissance': _date,
          'phone': _phone,
          'eMail': arg.email,
          'password': encrypt(arg.password),
          'sexe': _sexe,
          'isAdmin': false,
          'favoris': [],
        });
        Provider.of<FavoriteProvider>(context, listen: false).clear();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen()),
        );
      }
    }
  }

  ///Permet d'afficher le formulaire pour saisir le nom
  Widget _buildNomTF(bool trad) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          trad ? 'Nom' : 'Last Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            validator: (input) => input.isEmpty
                ? trad
                    ? 'Ce champ est obligatoire'
                    : 'This field is required'
                : null,
            onSaved: (input) => _nom = input,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Myriade',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: 'Ex: John',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  ///Permet d'afficher le formulaire pour saisir le prenom
  Widget _buildPrenomTF(bool trad) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          trad ? 'Prénom' : 'First Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            validator: (input) => input.isEmpty
                ? trad
                    ? 'Ce champ est obligatoire'
                    : 'This field is required'
                : null,
            onSaved: (input) => _prenom = input,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Myriade',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: 'Ex: Doe',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  ///Permet d'afficher le formulaire pour saisir le numéro de téléphone
  Widget _buildPhoneTF(bool trad) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          trad ? 'Numéro de téléphone' : 'Mobile number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            validator: (input) => input.isEmpty
                ? trad
                    ? 'Ce champ est obligatoire'
                    : 'This field is required'
                : null,
            onSaved: (input) => _phone = input,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Myriade',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: 'Ex: 0666666666',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  ///Permet d'afficher le formulaire pour saisir la date de naissance
  Widget _buildDateNaissanceTF(bool trad) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          trad ? 'Date de Naissance' : 'Birthday',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            keyboardType: TextInputType.datetime,
            validator: (input) => input.isEmpty
                ? trad
                    ? 'Ce champ est obligatoire'
                    : 'This field is required'
                : null,
            onSaved: (input) => _date = input,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Myriade',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14.0),
              prefixIcon: Icon(
                Icons.date_range,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: 'Ex: 01/01/1970',
              
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  ///Permet de sélectionner le sexe
  Widget _buildSexeCheckbox(bool trad) {
    return Container(
      child: Row(
        children: <Widget>[
          LinkedLabelRadio(
            label: trad ? 'Femme' : 'Female',
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            value: true,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isRadioSelected = newValue;
                _sexe = 'Femme';
              });
            },
          ),
          LinkedLabelRadio(
            label: trad ? 'Homme' : 'Male',
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            value: false,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isRadioSelected = newValue;
                _sexe = 'Homme';
              });
            },
          ),
        ],
      ),
    );
  }

  ///Permet d'afficher les conditions générales d'utilisation
  Widget _buildConditions(bool trad) {
    return GestureDetector(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: trad
                    ? "En cliquant sur S\’inscrire, vous acceptez nos "
                    : 'By clicking Sign Up, you agree to our 121',
                style: TextStyle(
                  color: _color,
                  fontSize: 14.0,
                  fontFamily: 'Myriade',
                  decoration: _deco,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: trad ? 'Conditions générales' : 'Terms',
                style: TextStyle(
                  color: _color,
                  fontFamily: 'Myriade',
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print('Term Button Pressed');
          setState(() {
            _color = Color(0xFF717C7B);
            _deco = TextDecoration.underline;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConditionsScreen()),
          );
        });
  }

  ///Permet d'afficher le bouton s'inscrire
  Widget _buildSignBtn(ScreenArgument arg, bool trad) {
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
            trad ? 'S\'inscrire' : 'Sign up',
            style: TextStyle(
              color: Color.fromRGBO(209, 62, 150, 1),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Myriade',
            ),
          ),
          onPressed: () {
            _submit(arg);
          }),
    );
  }

  ///Permet d'afficher le deuxième formulaire d'inscription

  @override
  Widget build(BuildContext context) {
    final ScreenArgument arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Colors.white,
                    ],
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 130.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        arg.trad ? 'Inscription' : 'Sign up',
                        style: TextStyle(
                          color: Color.fromRGBO(209, 62, 150, 1),
                          fontFamily: 'Myriade',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
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
                                    _buildNomTF(arg.trad),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    _buildPrenomTF(arg.trad),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    _buildDateNaissanceTF(arg.trad),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    _buildPhoneTF(arg.trad),
                                    SizedBox(
                                      height: 9.0,
                                    ),
                                    _buildSexeCheckbox(arg.trad),
                                    SizedBox(
                                      height: 9.0,
                                    ),
                                    _buildConditions(arg.trad),
                                    SizedBox(
                                      height: 9.0,
                                    ),
                                    _buildSignBtn(arg, arg.trad)
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 28,
                child: IconButton(
                    icon: Icon(
                      Icons.west,
                      color: Color.fromRGBO(209, 62, 150, 1),
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
