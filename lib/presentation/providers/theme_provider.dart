import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_application/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// Inmutable : Listado de colores
// con el provider, se maneja valores immutables
final colorListProvider = Provider((ref) => colorlist);

final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme, cuando el state es algo mas elaborado
// podemos trabajarlo con ese state
//StateNotifierProvider<Nombre de la clase que va a controlar, y esta es la clase que va a manejar el estado>

// estp es cuando el estado a manejar es complejo
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// tambien se puede llamar ThemeController o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new Apptheme() -> manejamos el estado de este objeto
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
