import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_application/presentation/screens/cards/card_screen.dart';

import '../../../config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // para los nombres de navegacion, creamos una propieudad estatica

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter mas material 3"),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    // manejamos el theme
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        color: colors.primary,
        menuItem.icon,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
      ),
      title: Text(
        menuItem.title,
      ),
      subtitle: Text(
        menuItem.subtitle,
      ),

      // Push es un stack de tarjetas
      // si quieres echar para atras usar el pop
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        // OTRA FORMA
        // Esto declarando en el main la ruta,
        // Navigator.pushNamed(context, menuItem.link);

        // usandod goRoutes, extendie en el context
        // lo que pasa es que goRoute, extiende al contexto su metodos para usarse
        context.push(menuItem.link);
        // context.pushNamed(CardScreen.name); // usamos el nombre de la pantalla a navegar mediante una propiuedad estatica
      },
    );
  }
}
