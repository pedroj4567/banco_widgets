import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_application/presentation/providers/counter_provider.dart';
import 'package:widget_application/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});
// ConsumerWidget -> widget propio de riverpod
// Es lo mismo que el stateless o stateWidget pero para riverpod

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Usamos el wacht para ver la referencia del estado
    // cuando tenga cambios, ese lo observa
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    Icon getThemeIconMode(bool isDarkMode) => isDarkMode
        ? Icon(Icons.dark_mode_outlined)
        : Icon(Icons.light_mode_outlined);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador Screen"),
        actions: [
          IconButton(
            onPressed: () {
              // if (!isDarkMode) {
              //   ref.read(isDarkModeProvider.notifier).state = true;
              // } else {
              //   ref.read(isDarkModeProvider.notifier).state = false;
              // }
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((isDarkMode) => !isDarkMode);
            },
            icon: getThemeIconMode(isDarkMode),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Valor: $clickCounter",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // En metodos no se usa el watch nunca, se usa es el read
          // notifier notifica el cambio, el .state maneja el valor del stado a manejar
          ref.read(counterProvider.notifier).state++;

          // OTRA FORMA
          // // se usa el update mehtod para modificar.
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
