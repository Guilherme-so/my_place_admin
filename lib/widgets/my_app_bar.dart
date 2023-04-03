import 'package:flutter/material.dart';

import 'my_button_icon.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    this.title,
    this.withLeading = true,
    this.actions,
    super.key,
  });

  final Widget? title;
  final bool withLeading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: preferredSize.height,
        child: AppBar(
          automaticallyImplyLeading: false,
          title: title,
          leadingWidth: 40,
          leading: !withLeading
              ? null
              : MyButtonIcon(
                  iconData: Icons.chevron_left,
                  onPressed: () => Navigator.of(context).pop(),
                ),
          actions: actions,
        ),
      ),
    );
  }
}
