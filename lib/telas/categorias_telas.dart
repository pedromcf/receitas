import 'package:flutter/material.dart';
import '../components/categoria_item.dart';
import '../data/dummy_data.dart';

class CategoriasTelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding:  const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIAS.map((cat){
          return CategoriaItem(cat);
        }).toList(),
    );    
  }
}