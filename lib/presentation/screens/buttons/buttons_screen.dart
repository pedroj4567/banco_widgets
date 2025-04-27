import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'button_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons Screen"),
      ),
      body: _ButtonsView(),

      // Primer boton
      // Boton flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop(); // con esto salimos de esta pantalla
        },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Elevated button"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Elevated button disabled"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                "Elevated Icon",
              ),
              icon: Icon(
                Icons.lock_clock,
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: Text("Filled"),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.access_time,
              ),
              label: Text(
                "Filled icon",
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                "Outline button",
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.zoom_out_map_outlined,
              ),
              label: Text(
                "Outline button",
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Button de texto",
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.access_time_filled_sharp,
              ),
              label: Text(
                "Button de texto",
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.access_alarm,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.access_alarm,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.airplanemode_active_sharp,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.secondary),
              ),
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          // onDoubleTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              "Hola mundo",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
