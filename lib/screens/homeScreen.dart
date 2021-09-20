
import 'package:flutter/material.dart';
import '../screens/carteScreen.dart';
import 'authentificationScreen/LoginScreen.dart';
import 'authentificationScreen/SignScreen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home.dart';
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: <Widget>[
        Positioned.fill(
          //
          child: Image(
            image: AssetImage('assets/images/carte_earth_large.png'),
            fit: BoxFit.cover,
          ),
        ),

        Container(
           width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              Container(
              alignment: Alignment.center,
              width: 340,
              child:Text(
                'AURA', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'myriad',
                    
                  
                ),
              )
              ),

            ],
          ),
        ),
      
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                alignment: Alignment.center,
                width: 340,
                child: GestureDetector(
                    child: Image(
                      image: AssetImage(
                          'assets/images/AURA_bouton_me_connecter.png'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                alignment: Alignment.center,
                width: 340,
                child: GestureDetector(
                    child: Image(
                      image:
                          AssetImage('assets/images/AURA_bouton_minscrire.png'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignScreen()),
                      );
                    }),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
        Container(
           width: double.infinity,
          child: Column(
             //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
              alignment: Alignment.center,
              width: 340,
              child:GestureDetector(
                  child: Image(
                    image: AssetImage(
                        'assets/images/AURA_bouton_connecte_ plus_tard.png'),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarteScreen(auth:false)),
                    );
                  }),
              ),

               SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
