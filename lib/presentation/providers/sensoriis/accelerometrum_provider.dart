import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';


class AccelerometrumXYZ {

  final double x;
  final double y;
  final double z;

  AccelerometrumXYZ(this.x, this.y, this.z);

  @override
  String toString() {
    return '''
      x:$x
      y:$y
      z:$z
    ''';
  }
}

final accelerometrumGravitasProvider = StreamProvider.autoDispose<AccelerometrumXYZ>((ref) async* {

  final accelerometrumEventus = accelerometerEventStream();

  await for ( final event in accelerometrumEventus ) {
    final x = double.parse( event.x.toStringAsFixed(2) );
    final y = double.parse( event.y.toStringAsFixed(2) );
    final z = double.parse( event.z.toStringAsFixed(2) );

    yield AccelerometrumXYZ(x, y, z);
  }
});


final accelerometrumUserProvider = StreamProvider.autoDispose<AccelerometrumXYZ>((ref) async* {

  final useAccelerometrumEventus = userAccelerometerEventStream();
  
  await for ( final event in useAccelerometrumEventus ) {
    final x = double.parse( event.x.toStringAsFixed(2) );
    final y = double.parse( event.y.toStringAsFixed(2) );
    final z = double.parse( event.z.toStringAsFixed(2) );

    yield AccelerometrumXYZ(x, y, z);
  }
});