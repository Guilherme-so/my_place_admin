import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 57,
      child: Stack(
        children: [
          Text(
            'Argo',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              'admin',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
