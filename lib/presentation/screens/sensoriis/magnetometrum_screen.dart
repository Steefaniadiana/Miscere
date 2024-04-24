import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class MagnetometrumScreen extends ConsumerWidget {
  const MagnetometrumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final magnetometrum$ = ref.watch( magnetometrumProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetómetro'),
      ),
      body: Center(
        child:  magnetometrum$.when(
          data: (value) => Text(
            value.x.toString(),  
            style: const TextStyle(fontSize: 30),
          ), 
          error: (error, stackTrace) => Text('$error'), 
          loading: () => const CircularProgressIndicator()
        )
      )
    );
  }
}