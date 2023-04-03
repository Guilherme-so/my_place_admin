import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_place_admin/widgets/loading.dart';
import 'package:my_place_admin/widgets/my_app_bar.dart';
import 'package:my_place_admin/widgets/my_button_icon.dart';

import '../../widgets/empty_state.dart';
import 'lista_controller.dart';

class ListaCategoria extends StatelessWidget {
  const ListaCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = ListaController();

    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          "Lista de categorias",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          MyButtonIcon(
            iconData: Icons.add,
            onPressed: () {},
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _controller.categoriaStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categorias =
                _controller.getCategoriasFromDocs(snapshot.data!.docs);

            if (categorias.isEmpty) {
              return const EmptyState();
            } else {
              return const Text("data");
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Loading(),
            );
          }
          return const EmptyState();
        },
      ),
    );
  }
}
