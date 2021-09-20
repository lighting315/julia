import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomAppBar extends StatelessWidget {
  /// Le titre du precedent screen
  final String from;
  const CustomAppBar({this.from});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
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
              from,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'myriad',
                fontSize: 15,
                color: Color.fromRGBO(209, 62, 150, 1),
              ),
            ),
          ],
        ),
    );
  }
}
