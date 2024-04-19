import 'package:flutter/material.dart';

class PyxisScreen extends StatelessWidget {
  const PyxisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Brújula'),
      ),
      body: const Center(
        child: Text('Holii'),
      ),
    );
  }
}