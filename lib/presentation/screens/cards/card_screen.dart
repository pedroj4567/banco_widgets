import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  static const String name = 'card_screen';

  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards Screen"),
      ),
      body: Placeholder(),
    );
  }
}
