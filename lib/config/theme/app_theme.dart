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
  Colors.white
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(
          selectedColor >= 0,
          'Selected Color must be grather than 0',
        ),
        assert(selectedColor < colorlist.length,
            'Selected color must be less or equal than ${colorlist.length - 1}');

// Aqui aplicamos los temas de la app
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorlist[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );

  // CON ESTO MANEJAMOS UNA COPIA DE LA FUNCION, PERO ES MEJOR MANEJAR UNA COPIA DEL ESTADO ANTEIOR AL QUE SE USA
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
