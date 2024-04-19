import 'package:flutter/material.dart';

class MagnetometrumScreen extends StatelessWidget {
  const MagnetometrumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Magnetómetro'),
      ),
      body: const Center(
        child: Text('Holii'),
      ),
    );
  }
}