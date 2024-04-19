import 'package:flutter/material.dart';
import 'package:miscere_varius_ifab/presentation/widgets/shared/core_menu.dart';

class DomusScreen extends StatelessWidget {
  const DomusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      
      body:  Padding( 
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
        slivers: [ 
          SliverAppBar(
            title: const Text('Miscere Varius'),
        centerTitle: false,
          ),
          const CoreMenu()
        ],
        ),
      ),
    );
  }
}