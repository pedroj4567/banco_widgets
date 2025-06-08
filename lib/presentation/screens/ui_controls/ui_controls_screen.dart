import 'package:flutter/material.dart';

class UiControllsScreen extends StatelessWidget {
  const UiControllsScreen({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controllers + tiles'),
      ),
      body: _UIControlView(),
    );
  }
}

class _UIControlView extends StatefulWidget {
  @override
  State<_UIControlView> createState() => _UIControlViewState();
}

// creamos un enum

enum Transportation { car, plane, boat, submarine }

class _UIControlViewState extends State<_UIControlView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // ClampingScrollPhysics() -> evita la fisica de rebote
      // BouncingScrollPhysics -> APLICA LA FISICA DE REBOTTE
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text("Developer Mode"),
          subtitle: Text("Controles Adicionales"),
          value: isDeveloper,
          onChanged: (value) => setState(
            () {
              isDeveloper = !isDeveloper;
            },
          ),
        ),
        ExpansionTile(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          title: const Text("Vehiculo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              value: Transportation.car,
              title: const Text('By Car'),
              subtitle: const Text('Viaje por carro'),
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.car;
                },
              ),
            ),
            RadioListTile(
              value: Transportation.boat,
              title: const Text('By Boat'),
              subtitle: const Text('Viaje por bote'),
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.boat;
                },
              ),
            ),
            RadioListTile(
              value: Transportation.plane,
              title: const Text('By Plane'),
              subtitle: const Text('Viaje por avion'),
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.plane;
                },
              ),
            ),
            RadioListTile(
              value: Transportation.submarine,
              title: const Text('By Submarino'),
              subtitle: const Text('Viaje por submarino'),
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.submarine;
                },
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Modalidades de desayuno"),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          children: [
            CheckboxListTile(
              value: true,
              title: const Text("Desayuno?"),
              onChanged: (value) {},
            ),
            CheckboxListTile(
              value: true,
              title: const Text("Almuerzo?"),
              onChanged: (value) {},
            ),
            CheckboxListTile(
              value: true,
              title: const Text("Cena?"),
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
