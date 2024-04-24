import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class AccelerometrumScreen extends ConsumerWidget {
  const AccelerometrumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final accelerometrum$ = ref.watch( accelerometrumGravitasProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerómetro'),
      ),
      body: Center(
        child:  accelerometrum$.when(
          data: (value) => Text(
            value.toString(),
            style: const TextStyle(fontSize: 30),
          ), 
          error: (error, stackTrace) => Text('$error'), 
          loading: () => const CircularProgressIndicator()
        ),
      ),
    );
  }
}