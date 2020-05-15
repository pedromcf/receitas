import 'package:flutter/material.dart';

import 'categorias_telas.dart';
import 'favoritas_telas.dart';

class TabsTelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:Text('Vamos cozinhar?'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categorias',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favoritos',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoriasTelas(),
          FavoritasTelas(),
        ]),
      ),
      
    );
  }
}