import 'package:flutter/material.dart';
import '../models/categoria.dart';

import '../utils/app-routes.dart';


class CategoriaItem extends StatelessWidget {

  final Categoria categoria;

  const CategoriaItem(this.categoria);

  void _selectCategoria(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIAS_RECEITAS,
      arguments: categoria,);    
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategoria(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          categoria.titulo,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoria.color.withOpacity(0.5),
              categoria.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ), 
      ),
    );
  }
}