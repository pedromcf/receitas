import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../models/refeicao.dart';
import '../data/dummy_data.dart';
import '../components/refeicao_item.dart';

class CategoriasReceitasTelas extends StatelessWidget {
  final List<Refeicao> refeicoes;

  const CategoriasReceitasTelas(this.refeicoes);

  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context).settings.arguments as Categoria;

    final categoriaRefeicao = refeicoes.where((refeicao) {
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
        },
      )),
    );
  }
}
