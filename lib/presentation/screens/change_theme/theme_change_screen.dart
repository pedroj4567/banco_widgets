import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_application/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  const ThemeChangeScreen({super.key});
  static final String name = 'change_theme_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cambiar tema"),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((isDarkMode) => !isDarkMode);
            },
            icon: getThemeIconMode(isDarkMode),
          )
        ],
      ),
      body: _ThemeViewChangeView(),
    );
  }
}

class _ThemeViewChangeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final optionSelected = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          value: index,
          title: Text(
            'Este color',
            style: TextStyle(
              color: color,
            ),
          ),
          subtitle: Text("${color.value}"),
          activeColor: color,
          groupValue: optionSelected,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}

Icon getThemeIconMode(bool isDarkMode) => isDarkMode
    ? Icon(Icons.dark_mode_outlined)
    : Icon(Icons.light_mode_outlined);
