import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Color(0xFF9B9A9A),
  fontFamily: 'Myriade',
);

final kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Myriade',
);

final kBoxDecoStyle = BoxDecoration(
  color: Color(0xFFECEBEB),
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 6.0,
      offset: Offset(5, 5),
    ),
  ],
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(209, 62, 150, 1),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
