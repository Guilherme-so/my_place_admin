import 'package:flutter/material.dart';

class MyCustomListView extends StatelessWidget {
  const MyCustomListView({this.itemCount, this.itemBuilder, super.key});

  final int? itemCount;
  final IndexedWidgetBuilder? itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: ListView.separated(
        itemBuilder: itemBuilder!,
        separatorBuilder: (context, i) => const Divider(
          height: 1,
          indent: 68,
        ),
        itemCount: itemCount!,
      ),
    );
  }
}
