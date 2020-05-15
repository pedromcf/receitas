import 'package:flutter/material.dart';

enum Complexity{
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Refeicao{
  final String id;
  final List<String> categorias;
  final String titulo;
  final String imageURL;
  final List<String> ingredientes;
  final List<String> passos;
  final int duracao;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetariano;
  final Complexity complexity;
  final Cost cost;

  const Refeicao({
    @required this.id,
    @required this.categorias,
    @required this.titulo,
    @required this.imageURL,
    @required this.ingredientes,
    @required this.passos,
    @required this.duracao,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetariano,
    @required this.complexity,
    @required this.cost,    
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Medium:
        return 'Normal';
      case Complexity.Difficult:
        return 'Dificil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch(cost) {
      case Cost.Cheap:
        return 'Barato';
      case Cost.Fair:
        return 'Justo';
      case Cost.Expensive:
        return 'Caro';
      default:
        return 'Desconhecida';
    }
  }
}