import 'package:flutter/material.dart';

class MyCustomListTile extends StatelessWidget {
  const MyCustomListTile(
      {this.leading, this.trailing, this.title, this.onTap, super.key});

  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      visualDensity: VisualDensity.compact,
      leading: leading == null
          ? null
          : Container(
              alignment: Alignment.center,
              width: 36,
              child: leading,
            ),
      trailing: trailing!,
      title: title,
      onTap: onTap,
    );
  }
}
