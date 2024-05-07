import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final vigiliaLocusProvider = StreamProvider.autoDispose<(double, double)>((ref) async* {
   
    bool serviceEnabled;
    LocationPermission permission;

    // Por si está deshabilitado el servicio 
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      // return Future.error('Location services are disabled.');
      // Pongo throw en lugar de return para ver los mensajes, y quito Future.error 
      throw 'Location services are disabled.';
    }

    // Se revisan los permisos.
    permission = await Geolocator.checkPermission();

    // Si está denegado lo solicita
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // Y si después de la solicitud sigue denegado
      if (permission == LocationPermission.denied) {

        // return Future.error('Location permissions are denied');
        // Pongo un throw en lugar de return
        throw 'Location permissions are denied';
      }
    }
  
    // Si el permiso está permanentemente denegado
    if (permission == LocationPermission.deniedForever) {
      // return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      // 30 Pongo un throw en lugar de return
      throw  'Location permissions are permanently denied, we cannot request permissions.';
    } 
    
    await for ( final location in Geolocator.getPositionStream()) {
      yield (location.latitude, location.longitude);
    }

});