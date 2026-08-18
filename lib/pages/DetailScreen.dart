import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item $id')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).maybePop(),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
