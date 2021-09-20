import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/customAppBar.dart';
import 'package:flutter/material.dart';

/// affchage de la fenetre contacter nous (avec le mail de contact)
class PolitiqueScreen extends StatelessWidget {
  static const routeName = '/politique.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(4),
                    height: 45,
                    child: Text(
                      'Politique de confidentialité',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(209, 62, 150, 1),
                          fontFamily: 'myriad'),
                    )),
                StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection('Politique')
                        .doc('oypsLFqN4u8rphLWxDdJ')
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        String _text = snapshot.data.get('contenu');

                        List<String> _liste = _text.split('&title');

                        return Container(
                          height: MediaQuery.of(context).size.height -
                              100 -
                              kToolbarHeight,
                          child: ListView.builder(
                            itemCount: _liste.length,
                            itemBuilder: (ctx, index) => Center(
                              child: Container(
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.symmetric(horizontal: 15),
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
                        );
                      } else
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
