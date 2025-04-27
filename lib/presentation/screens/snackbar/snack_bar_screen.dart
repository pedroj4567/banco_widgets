import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});
  static const name = 'snackbar_screen';

  // primero debemos indificar el scafold para el snapbar

  void showCustomSnapbar(BuildContext context) {
    // ScaffoldMessenger -> con esto manejos los snackbars
    // para evitar que se repita los snackbard usamos
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text("Mi snackbar"),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(
        seconds: 3,
      ),
    );

    // para evitar que se repita los snackbard usamos
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            false, // con esto quitamos la accion de darle por fuera del dialogo para salir
        builder: (context) => AlertDialog(
              title: Text("Estas Seguro?"),
              content: const Text(
                  "CODIGO DE REPARACION NUMERO 1000000 PERO SIN ESTO NO FUNCIONA, ESTO ES UN RAMDON TEXT"),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text("Cancelar"),
                ),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text("Aceptar"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snacbar y Dialogos"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnapbar(context),
        label: Text("Mostrar Snapbar"),
        icon: Icon(
          Icons.remove_red_eye_outlined,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [Text("Licencias de dependencias")],
                );
              },
              child: Text("Licencia y permisos"),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text("Mostrar dialogos"),
            )
          ],
        ),
      ),
    );
  }
}
