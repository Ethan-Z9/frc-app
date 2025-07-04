import 'package:flutter/material.dart';

class PitScoutPage extends StatelessWidget {
  const PitScoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pit')),
      body: const Center(child: Text('Pit Scout Content here')),
    );
  }
}
