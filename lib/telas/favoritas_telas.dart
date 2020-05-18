import 'package:flutter/material.dart';
import '../models/refeicao.dart';
import '../components/refeicao_item.dart';

class FavoritasTelas extends StatelessWidget {

  final List<Refeicao> favoriteMeals;

  const FavoritasTelas(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Nenhuma refeição marcada como favorita!'),      
      );

    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index){
          return RefeicaoItem(favoriteMeals[index]);
        });
    }

    
  }
}