import 'screens/carteScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/drawerScreens/politiqueScreen.dart';
import './providers/UserProvider.dart';
import 'screens/drawerScreens/aProposScreen.dart';
import 'screens/drawerScreens/conditionScreen.dart';
import 'screens/drawerScreens/contacterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/homeScreen.dart';
import 'screens/authentificationScreen/LoginScreen.dart';
import 'screens/authentificationScreen/SignConfirmScreen.dart';
import './providers/commentProvider.dart';
import './providers/tagProvider.dart';
import './providers/articleProvider.dart';
import './providers/markerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'providers/favoriteProvider.dart';
import 'screens/authentificationScreen/SignScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MarkerProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TagProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CommentaireProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AURA',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'myriad'),
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('You have an error ! ${snapshot.error.toString()}');
              return Text('Something went wrong !');
            } else if (snapshot.hasData) {
              return StreamBuilder<User>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.emailVerified) {
                      return CarteScreen(
                        auth: true,
                        login: snapshot.data,
                      );
                    }
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return HomeScreen();
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignConfirmScreen.routeName: (ctx) => SignConfirmScreen(),
          SignScreen.routeName: (ctx) => SignScreen(),
          ConditionScreen.routeName: (ctx) => ConditionScreen(),
          ContacterScreen.routeName: (ctx) => ContacterScreen(),
          AProposScreen.routeName: (ctx) => AProposScreen(),
          PolitiqueScreen.routeName: (ctx) => PolitiqueScreen(),
        },
      ),
    );
  }
}
