import 'package:flutter/material.dart' show IconData, Icons;
// con el show solo tomo lo necesario del paquete

// elemento del meniu
class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios Botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subtitle: 'Generales y controlador',
    link: '/progress',
    icon: Icons.refresh_outlined,
  ),
  MenuItem(
    title: 'Snack Bars',
    subtitle: 'Snacks bars y dialogos',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'Staful widget animado',
    link: '/animated',
    icon: Icons.check_outlined,
  ),
  MenuItem(
    title: 'UI Controls y tiles',
    subtitle: 'Controladores + tiles',
    link: '/ui-controlers',
    icon: Icons.pan_tool,
  ),
  MenuItem(
    title: 'Onboarding  / Tutorial',
    subtitle: 'Pequenio tutorial introductorio',
    link: '/onboarding',
    icon: Icons.integration_instructions,
  ),
  MenuItem(
    title: 'Infinite Scroll',
    subtitle: 'Lista infinita y  pull refresh',
    link: '/infinite-scroll',
    icon: Icons.list,
  ),
  MenuItem(
    title: 'Counter Screen',
    subtitle: 'Manejo de estados con Riverpod',
    link: '/river-pod-manager',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Theme Change',
    subtitle: 'Cambio de tema con riverpod',
    link: '/theme-change',
    icon: Icons.remove_road_outlined,
  ),
];
