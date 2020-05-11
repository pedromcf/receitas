import 'package:flutter/material.dart';
import '../models/categoria.dart';

class CategoriasReceitasTelas extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context).settings.arguments as Categoria;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
      ),
      body: Center(
        child: Text('Receitas por categoria ${categoria.id}'),
      ),
      
    );
  }
}