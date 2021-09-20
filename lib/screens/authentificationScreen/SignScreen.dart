import '../../models/screenArgument.dart';
import 'LoginScreen.dart';
import '../../utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class SignScreen extends StatefulWidget {
  static const routeName = '/Sign.dart';
  const SignScreen({Key key}) : super(key: key);
  @override
  SignScreenState createState() => SignScreenState();
}

class SignScreenState extends State<SignScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool trad = true;
  bool _isSecret = true;
  bool _isSecret1 = true;
  String _email = '';
  String _password;
  String _passwordConfirm;

  //bool _rememberMe = false;

  String getMail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }

  ///Affichage le formulaire de mail  dans la fenêtre d'inscription
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
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Myriade',
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

  ///Afficher le formulaire de mot de passe
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
              fontFamily: 'Myriade',
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

  /// afficher le formulaire de confirmation de mot de passe
  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          trad ? 'Confirmer votre Mot de Passe' : 'Confirm your password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextFormField(
            obscureText: _isSecret1,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Myriade',
            ),
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () => setState(() => _isSecret1 = !_isSecret1),
                child:
                    Icon(!_isSecret1 ? Icons.visibility : Icons.visibility_off),
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
            onChanged: (value) => setState(() => _passwordConfirm = value),
            validator: (input) =>
                input.length < 6 || _password != _passwordConfirm
                    ? trad
                        ? 'La confirmation du mot de passe n\'est pas valide.'
                        : 'incorrect password'
                    : null,
            onSaved: (input) => _passwordConfirm = input,
          ),
        ),
      ],
    );
  }

  /// affichage du bouton suivant qui  permet d'aller dans la deuxième page d'inscription
  Widget _buildSuivantBtn() {
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
            trad ? 'SUIVANT' : 'Next',
            style: TextStyle(
              color: Color.fromRGBO(209, 62, 150, 1),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Myriade',
            ),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              Navigator.pushNamed(
                context,
                '/SignConfirm.dart',
                arguments: ScreenArgument(_email, _password, trad),
              );
            }
          }),
    );
  }

  ///permettre à l'utilisateur d'aller dans la page de connexion s'il possède déja un compte
  Widget _buildLoginBtn() {
    return GestureDetector(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    trad ? "Vous avez un compte? \n" : "you have an account \n",
                style: TextStyle(
                  fontFamily: 'Myriade',
                  color: Color.fromRGBO(209, 62, 150, 1),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: trad ? 'Connectez-vous' : 'Log in',
                style: TextStyle(
                  fontFamily: 'Myriade',
                  color: Color.fromRGBO(209, 62, 150, 1),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print('Login Button Pressed');
          setState(() {});

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
  }

  ///Affichage de la première page d'inscription
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
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
                  Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromRGBO(209, 62, 150, 1),
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
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
                        trad ? 'Inscription' : 'Sign up',
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
                                    _buildEmailTF(),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    _buildPasswordTF(),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    _buildConfirmPasswordTF(),
                                    _buildSuivantBtn(),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: 20.0),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
