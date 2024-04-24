import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscere_varius_ifab/presentation/providers/sensoriis/gyroscope_provider.dart';

class GyroscopeSpheraScreen extends ConsumerWidget {
  const GyroscopeSpheraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gyroscope$ = ref.watch( gyroscopeProvider );

    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Giroscopio chulisimo'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (value) => MovereSphera(x: value.x, y: value.y), 
          error: (error, stackTrace) => Text('$error'), 
          loading: ()=> const Center( child: CircularProgressIndicator(),),
        ),        
      ),
    );
  }
}

class MovereSphera extends StatelessWidget {
  
  final double x;
  final double y; 

  const MovereSphera({
    super.key, 
    required this.x, 
    required this.y
  });

  @override
  Widget build(BuildContext context) {

    final magnitudine = MediaQuery.of(context).size;
    
    double latitudo = magnitudine.width;
    double altitudo = magnitudine.height;

    double nuncYPos = y * 100; // velocidad de la bola
    double nuncXPos = x * 100; // velocidad de la bola 

    return Stack(
      alignment: Alignment.center, 
      children: [
        AnimatedPositioned(
          curve: Curves.easeInOut,
          left: nuncYPos -25 + latitudo/2,
          top: nuncXPos -25 + altitudo/2.5,  // calculos para cuadrar el centro de la bola kkkkkkk
          duration: const Duration(milliseconds: 100),
          child: const Sphera()
        ),
        Text('''
        X: $x
        Y: $y
        ''', style: TextStyle(fontSize: 30),
        )
      ]
    );
  }
}

class Sphera extends StatelessWidget {
  const Sphera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }
}