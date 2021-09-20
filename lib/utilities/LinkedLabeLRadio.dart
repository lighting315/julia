import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
     this.label,
    this.padding,
    this.groupValue,
    this.value,
   this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Radio<bool>(
              groupValue: groupValue,
              value: value,
              activeColor:Color.fromRGBO(209, 62, 150, 1), 
              onChanged: (bool newValue) {
                onChanged(newValue);
              }),
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                 fontFamily: 'Myriade',
                color: Colors.black,
                //decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}