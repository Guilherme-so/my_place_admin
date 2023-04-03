import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({this.fontSize = 40, super.key});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: fontSize / 3.5),
          child: Text(
            'Argo',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Text(
            'admin',
            style: TextStyle(
              color: Colors.grey,
              fontSize: fontSize / 2.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
