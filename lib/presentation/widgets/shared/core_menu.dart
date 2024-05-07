import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 

class MenuItem {
  final String titulus;
  final IconData icon;
  final String route;

  MenuItem(this.titulus, this.icon, this.route);
}

final  menuItems = <MenuItem> [
  MenuItem ('Giroscopio', Icons.downloading, '/gyroscope'),
  MenuItem('Acelerómetro', Icons.speed, '/accelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/magnetometer'),
  MenuItem('Giróscopio Ball', Icons.sports_baseball_outlined, '/gyroscope-ball'),
  MenuItem('Brújula', Icons.explore, '/compass'),
  MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  MenuItem('Ubicación', Icons.pin_drop, '/location'),
  MenuItem('Mapas', Icons.map_outlined, '/maps'),
  MenuItem('Controlado', Icons.gamepad_outlined, '/controlled-map'),
];


class CoreMenu extends StatelessWidget {
  const CoreMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems.map((item) => DomusMenuItems(
        titulus: item.titulus, 
        icon: item.icon, 
        route: item.route,
        )).toList(),
    );
  }
}

class DomusMenuItems extends StatelessWidget {
  final String titulus;
  final IconData icon;
  final String route;
  final List<Color> bgColorum; 
  
  const DomusMenuItems({
    super.key,
    required this.titulus,
    required this.icon,
    required this.route,
    this.bgColorum = const [Colors.lightGreen, Colors.green]
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: bgColorum,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(titulus, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),)
      
          ],
        ),
      
      ),
    );
  }
}