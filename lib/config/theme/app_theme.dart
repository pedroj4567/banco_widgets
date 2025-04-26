import 'package:flutter/material.dart';

const colorlist = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  })  : assert(
          selectedColor >= 0,
          'Selected Color must be grather than 0',
        ),
        assert(selectedColor < colorlist.length,
            'Selected color must be less or equal than ${colorlist.length - 1}');

// Aqui aplicamos los temas de la app
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorlist[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );
}
