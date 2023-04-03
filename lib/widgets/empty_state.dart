import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.folder_open,
          size: 100,
          color: Theme.of(context).primaryColorLight,
        ),
        const Text(
          "Sem registros",
          style: TextStyle(fontSize: 22),
        ),
      ]),
    );
  }
}
