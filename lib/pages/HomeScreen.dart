import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int id) onItemTapped;
  const HomeScreen({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => onItemTapped(42),
          child: const Text('View Item 42'),
        ),
      ),
    );
  }
}
