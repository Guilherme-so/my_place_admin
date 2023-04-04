import 'package:flutter/material.dart';
import 'package:my_place_admin/pages/Categoria/FormCategoria/form_controller.dart';
import 'package:my_place_admin/widgets/my_button_icon.dart';

class FormCategoriaPage extends StatefulWidget {
  const FormCategoriaPage({super.key});

  @override
  State<FormCategoriaPage> createState() => _FormCategoriaPageState();
}

class _FormCategoriaPageState extends State<FormCategoriaPage> {
  final _formKey = GlobalKey<FormState>();
  FormCategoriaController _controller = FormCategoriaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, __) {
            return [
              SliverAppBar(
                expandedHeight: 240,
                collapsedHeight: 40,
                toolbarHeight: 38,
                elevation: 0.5,
                floating: false,
                pinned: true,
                leading: MyButtonIcon(
                  iconData: Icons.chevron_left,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                leadingWidth: 40,
                title: const Text(
                  'Criar categoria',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                actions: [
                  MyButtonIcon(
                    iconData: Icons.check,
                    onPressed: () async {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        await _controller.salvarCategoria();
                      }
                    },
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 44, 16, 20),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: double.infinity,
                          color: Theme.of(context).colorScheme.surface,
                          child: Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 100,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(.7),
                          child: PopupMenuButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).primaryColor,
                            ),
                            itemBuilder: (_) => [
                              PopupMenuItem<String>(
                                value: "Camera",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.photo_camera,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text("Camera")
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: "Galeria",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.photo_library,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text("Galeria")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Nome",
                          hintText: "Nome",
                        ),
                        validator: (nome) =>
                            nome!.isEmpty ? "Campo Obrigatorio" : null,
                        onSaved: (nome) => _controller.setCategoriaNome(nome!),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "DescriÇão",
                          hintText: "DescriÇão",
                        ),
                        validator: (descricao) =>
                            descricao!.isEmpty ? "Campo Obrigatorio" : null,
                        onSaved: (descricao) =>
                            _controller.setCategoriaDescricao(descricao!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
