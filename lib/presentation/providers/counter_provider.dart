import 'package:flutter_riverpod/flutter_riverpod.dart';

// Declaramos un stado al provider
// le damso valores iniciales
final counterProvider = StateProvider<int>((ref) => 5);
