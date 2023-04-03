import 'package:flutter/material.dart';

class MyButtonIcon extends StatelessWidget {
  const MyButtonIcon({
    this.iconData,
    this.onPressed,
    super.key,
  });

  final IconData? iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Icon(iconData),
      ),
    );
  }
}
