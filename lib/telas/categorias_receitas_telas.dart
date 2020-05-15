import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../data/dummy_data.dart';
import '../components/refeicao_item.dart';

class CategoriasReceitasTelas extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context).settings.arguments as Categoria;

    final categoriaRefeicao = DUMMY_REFEICOES.where((refeicao) {
      return refeicao.categorias.contains(categoria.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoriaRefeicao.length,
          itemBuilder: (ctx, index) {
            return RefeicaoItem(categoriaRefeicao[index]);
          } 
        ,)
        
      ),
      
    );
  }
}