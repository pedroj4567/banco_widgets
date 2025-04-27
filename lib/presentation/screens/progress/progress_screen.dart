import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});
  static const name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text indicator"),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text("Progress Circular indicator"),
          ),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            // opacitdad
            color: colors.primary,
            backgroundColor: Colors.black12,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Circular indicator controlado"),
          SizedBox(
            height: 10,
          ),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(
          milliseconds: 300,
        ),
        (value) {
          return (value * 2) / 100;
        },
      ).takeWhile(
        (value) => value < 100,
      ),
      // el take while frena la ejecucion en base a la validacion
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.black26,
                value: progressValue,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
