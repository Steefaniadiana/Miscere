
import 'package:flutter/material.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PokemonsVisum extends StatefulWidget {
  const PokemonsVisum({super.key});

  @override
  State<PokemonsVisum> createState() => _PokemonsVisumState();
}

class _PokemonsVisumState extends State<PokemonsVisum> {

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // controller: ,
      slivers: [
        SliverAppBar( 
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        )
      ],
    );
  }
}