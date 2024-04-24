import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';


class MagnetometrumXYZ {

  final double x;
  final double y;
  final double z;

  MagnetometrumXYZ(this.x, this.y, this.z);

  @override
  String toString() {
    return '''
      x:$x
      y:$y
      z:$z
    ''';
  }
}

final magnetometrumProvider = StreamProvider.autoDispose<MagnetometrumXYZ>((ref) async* {

  final magnetometrumEventus = magnetometerEventStream();

  await for ( final event in magnetometrumEventus ) {
    final x = double.parse( event.x.toStringAsFixed(2) );
    final y = double.parse( event.y.toStringAsFixed(2) );
    final z = double.parse( event.z.toStringAsFixed(2) );

    yield MagnetometrumXYZ(x, y, z);
  }
});