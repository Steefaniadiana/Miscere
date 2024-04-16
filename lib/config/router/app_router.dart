import 'package:go_router/go_router.dart';
import 'package:miscere_varius_ifab/presentation/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/', 
      builder: (context, state) => const DomusScreen()
      )
  ]
  );