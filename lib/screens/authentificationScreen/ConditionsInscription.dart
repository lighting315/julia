import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// les conditions générales à valider lors de l'inscription
class ConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Conditions générales d\'utilisation',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(209, 62, 150, 1),
                        fontFamily: 'myriad'),
                  )),
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection('conditionsGenerale')
                      .doc('9gnuEHsn8hPLDFXFh87O')
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
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: MediaQuery.of(context).size.width*0.5,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(209, 62, 150, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                      padding: EdgeInsets.all(15.0),
                    ),
                    child: Text(
                      'Valider',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onPressed: () {
                      // Logging in the user w/ Firebase
                      print(' Button Pressed');
                      Navigator.pop(context);
                      //Navigator.push(
                      //context,
                      //MaterialPageRoute(
                      //builder: (context) => SignConfirmScreen()),
                      //);
                    }),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
