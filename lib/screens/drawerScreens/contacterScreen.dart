import '../../widgets/customAppBar.dart';
import 'package:flutter/material.dart';

/// affchage de la fenetre contacter nous (avec le mail de contact)
class ContacterScreen extends StatelessWidget {
  static const routeName = '/contacter.dart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 100,
          leading: CustomAppBar(
            from: 'CARTE',
          )),
      body: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height-kToolbarHeight,
              width: double.infinity,
        child: Center(
          child: Container(
            height: 300,
            width: 250,
            child: Text(
              'Merci de nous contacter à l\'adresse suivante: exploreaura@gmail.com',
              style: TextStyle(fontFamily: 'myriad', fontSize: 23),
            ),
          ),
        ),
      ),
    );
  }
}
