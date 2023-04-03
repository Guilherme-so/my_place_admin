import 'package:flutter/material.dart';
import 'package:my_place_admin/core/Models/usuario_model.dart';
import 'package:my_place_admin/widgets/logo.dart';

import '../../widgets/my_app_bar.dart';
import '../Categoria/lista_categoria_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.user, super.key});

  final UsuarioModel user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(withLeading: false, title: Logo(fontSize: 28)),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: const [
            _Button(
              textProps: 'Categorias',
              iconProps: Icons.category,
              pageProps: ListaCategoria(),
            ),
            _Button(
              textProps: 'Produtos',
              iconProps: Icons.fastfood,
            ),
            _Button(
              textProps: 'Promoções',
              iconProps: Icons.campaign,
            ),
            _Button(
              textProps: 'Pedidos Pendente',
              iconProps: Icons.pending,
            ),
            _Button(
              textProps: 'Pedidos Finalizados',
              iconProps: Icons.flag,
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {this.pageProps, required this.iconProps, required this.textProps});

  final Widget? pageProps;
  final IconData iconProps;
  final String textProps;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => pageProps!),
          )
        },
        child: SizedBox(
          width: 100,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Icon(
                  iconProps,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    textProps,
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
