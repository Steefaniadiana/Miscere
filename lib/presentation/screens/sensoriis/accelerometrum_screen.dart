import 'package:flutter/material.dart';

class AccelerometrumScreen extends StatelessWidget {
  const AccelerometrumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Acelerometro'),
      ),
      body: const Center(
        child: Text('Holii'),
      ),
    );
  }
}