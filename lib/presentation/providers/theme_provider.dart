import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_application/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// Inmutable : Listado de colores
// con el provider, se maneja valores immutables
final colorListProvider = Provider((ref) => colorlist);

final selectedColorProvider = StateProvider<int>((ref) => 0);
