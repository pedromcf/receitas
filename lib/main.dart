import 'package:flutter/material.dart';

import 'telas/categorias_telas.dart';
import 'telas/categorias_receitas_telas.dart';
import 'telas/refeicao_detalhe_telas.dart';
import 'telas/tabs_telas.dart';

import 'utils/app-routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(        
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,  
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          )
        ),      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsTelas(),
        AppRoutes.CATEGORIAS_RECEITAS : (ctx) => CategoriasReceitasTelas(),
        AppRoutes.REFEICAO_DETAIL : (ctx) => RefeicaoDetalheTelas(),
        
      },      
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (_){
            return CategoriasTelas();
          },
        );
      },
    );
  }
}
