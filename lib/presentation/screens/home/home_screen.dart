import 'package:flutter/material.dart';

import '../../../config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      onTap: () {
        //TODO: Navegar a otras pantallas
      },
    );
  }
}
