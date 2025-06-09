import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_application/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    double marginTopByPlatform = hasNotch ? 10 : 20;

    return NavigationDrawer(
      // Mostramos la opcion seleccionada
      selectedIndex: navDrawerIndex,
      // Con este le damos la seleccion al menu

      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];

        context.push(menuItem.link);
        //  Tomamos el valor del widget y
        // tomamos el estado actual del scafold en donde tenemos el drawer
        widget.scaffoldKey.currentState?.closeDrawer();
      },

      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, marginTopByPlatform, 16, 10),
          child: Text('Menu'),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, marginTopByPlatform, 16, 10),
          child: Text('Otras opciones'),
        ),
        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        )
      ],
    );
  }
}
