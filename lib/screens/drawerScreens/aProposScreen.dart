import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/customAppBar.dart';
import 'package:flutter/material.dart';

///la fenêtre 'A propos de moi '
///Affichage de quelques  informations sur l'application aura
class AProposScreen extends StatefulWidget {
  static const routeName = '/a-propos.dart';

  const AProposScreen({Key key}) : super(key: key);

  @override
  _AProposScreenState createState() => _AProposScreenState();
}

class _AProposScreenState extends State<AProposScreen> {
  @override
  Widget build(BuildContext context) {
    // _buildContenu();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 100,
          leading: CustomAppBar(
            from: 'CARTE',
          )),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo_aura_violet.png'),
                      width: 50,
                    ),
                    Text(
                      'AURA',
                      style: TextStyle(fontSize: 40, fontFamily: 'myriad'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    'A propos de nous ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'myriad'),
                  )),
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection('Aproposdemoi')
                      .doc('KCFtWvJBDHA2HCMvdzVS')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      String _text = snapshot.data.get('contenu');

                      List<String> _liste = _text.split('&title');
                      return Scrollbar(
                        child: Container(
                          height: MediaQuery.of(context).size.height -
                              165 -
                              kToolbarHeight,
                          child: ListView.builder(
                            itemCount: _liste.length,
                            itemBuilder: (ctx, index) => Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                child: Text(
                                  _liste[index],
                                  style: TextStyle(
                                      fontSize: index % 2 == 0 ? 17 : 19,
                                      color: index % 2 == 0
                                          ? Colors.black
                                          : Colors.blue[900],
                                      fontWeight: index % 2 == 0
                                          ? FontWeight.normal
                                          : FontWeight.w600,
                                      fontFamily: 'myriad'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
