import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_place_admin/widgets/loading.dart';
import 'package:my_place_admin/widgets/my_app_bar.dart';
import 'package:my_place_admin/widgets/my_button_icon.dart';

import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_list_view.dart';
import '../../widgets/empty_state.dart';
import 'FormCategoria/form_categoria_page.dart';
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FormCategoriaPage()),
              );
            },
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
              return MyCustomListView(
                itemCount: categorias.length,
                itemBuilder: (context, index) => MyCustomListTile(
                  leading: categorias[index].urlImage != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(categorias[index].urlImage!),
                        )
                      : const Icon(Icons.category),
                  title: Text(categorias[index].nome!),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                  onTap: () {},
                ),
              );
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
