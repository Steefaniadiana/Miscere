import 'package:go_router/go_router.dart';
import 'package:miscere_varius_ifab/presentation/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/', 
      builder: (context, state) => const DomusScreen()
      ),
      GoRoute(
      path: '/accelerometer', 
      builder: (context, state) => const AccelerometrumScreen()
      ),
      GoRoute(
      path: '/gyroscope', 
      builder: (context, state) => const GyroscopeScreen()
      ),
      GoRoute(
      path: '/gyroscope-ball', 
      builder: (context, state) => const GyroscopeSpheraScreen()
      ),
      GoRoute(
      path: '/magnetometer', 
      builder: (context, state) => const MagnetometrumScreen()
      ),
      GoRoute(
      path: '/compass', 
      builder: (context, state) => const PyxisScreen()
      ),
  ]
  );