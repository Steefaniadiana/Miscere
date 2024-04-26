import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscere_varius_ifab/presentation/providers/providers.dart';
import 'package:miscere_varius_ifab/presentation/providers/pyxis/pyxis_provider.dart';

class PyxisScreen extends ConsumerWidget {
  const PyxisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pyxisHeading$ = ref.watch(pyxisProvider);

    return Scaffold( 
      backgroundColor: Colors.black,
      appBar: AppBar( 
        title: const Text('Brújula', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),

      ),
      body:  Center(
        child: pyxisHeading$.when(
          data: (heading) => Pyxis(heading: heading ?? 0 ), 
          error: (error, stackTrace) => Text('$error', style: const TextStyle(color: Colors.white)), 
          loading: ()=> const CircularProgressIndicator(),
          )
      ),
    );
  }
}

class Pyxis extends StatefulWidget {

  final double heading; 

  const Pyxis({
    super.key, 
    required this.heading
  });

  @override
  State<Pyxis> createState() => _PyxisState();
}

class _PyxisState extends State<Pyxis> {

  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {

    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction): direction;

    double diff = direction - prevValue;
    if(diff.abs() > 180) {

      if(prevValue > direction) {
        diff = 360 - (direction-prevValue).abs();
      } else {
        diff = 360 - (prevValue-direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text('${widget.heading.ceil()}', style: const TextStyle(color: Colors.white, fontSize: 30),), 
        // const SizedBox(height: 20,),

        Stack(
          alignment: Alignment.center,
          children: [
            //
            //Image.asset('assets/images/compass/quadrant-3.png'),

            // Image.asset('assets/images/compass/needle-1.png')
            //Transform.rotate(
              //angle: heading * pi/180 * -1,
              //child: Image.asset('assets/images/compass/needle-1.png'),
            //),

            AnimatedRotation(
              curve: Curves.easeInOut,
              turns: getTurns(), 
              duration: const Duration(milliseconds: 150,),
              child: Image.asset('assets/images/compass/quadrant-4.png'),
            ),
            Image.asset('assets/images/compass/needle-1.png')

          ],
        )
      ],
    );
  }
}