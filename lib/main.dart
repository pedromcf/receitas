import 'package:flutter/material.dart';
import 'telas/categorias_telas.dart';
import 'telas/categorias_receitas_telas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamnos Cozinhar?',
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
      home: CategoriasTelas(),
      routes: {
        '/categorias-receitas' : (ctx) => CategoriasReceitasTelas(),
      },
    );
  }
}
