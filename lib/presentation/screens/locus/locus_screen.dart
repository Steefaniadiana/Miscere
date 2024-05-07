import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscere_varius_ifab/presentation/providers/providers.dart';

class LocusScreen extends ConsumerWidget {
  const LocusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userLocusAsync = ref.watch(userLocusProvider);
    final vigiliaLocusAsync = ref.watch( vigiliaLocusProvider);

    return Scaffold(
      appBar: AppBar( 
        title: const Text('Ubicación'),
      ),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            const Text('Ubicación actual'),

            userLocusAsync.when(
              data:(data) => Text('$data'), 
              error:(error, stackTrace) => Text('$error'), 
              loading:() => const CircularProgressIndicator(),
              ),

            const SizedBox(height: 30,),
            const Text('Seguimiento de ubicación'),

            vigiliaLocusAsync.when(
              data:(data) => Text('$data'), 
              error:(error, stackTrace) => Text('$error'), 
              loading:() => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}