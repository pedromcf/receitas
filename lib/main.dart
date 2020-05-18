import 'package:flutter/material.dart';

import 'telas/categorias_telas.dart';
import 'telas/categorias_receitas_telas.dart';
import 'telas/refeicao_detalhe_telas.dart';
import 'telas/tabs_telas.dart';
import 'telas/settings_telas.dart';

import 'utils/app-routes.dart';

import 'models/refeicao.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Refeicao> _availableMeals = DUMMY_REFEICOES;
  List<Refeicao> _favoriteMeals = [];


  void _filterMeals(Settings settings){
    setState((){
      this.settings = settings;

      _availableMeals = DUMMY_REFEICOES.where((refeicao){
        final filterGluten = settings.isGlutenFree && !refeicao.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !refeicao.isLactoseFree;
        final filterVegan = settings.isVegan && !refeicao.isVegan;
        final filterVegetariano = settings.isVegetariano && !refeicao.isVegetariano;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetariano;
      }).toList();
    });
  }

  void _toggleFavorite(Refeicao refeicao){
    setState((){
      _favoriteMeals.contains(refeicao) ? _favoriteMeals.remove(refeicao): _favoriteMeals.add(refeicao);
    });

  }

  bool _isFavorite(Refeicao refeicao){
    return _favoriteMeals.contains(refeicao);
  }

  

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
        AppRoutes.HOME: (ctx) => TabsTelas(_favoriteMeals),
        AppRoutes.CATEGORIAS_RECEITAS : (ctx) => CategoriasReceitasTelas(_availableMeals),
        AppRoutes.REFEICAO_DETAIL : (ctx) => RefeicaoDetalheTelas(_toggleFavorite,_isFavorite),
        AppRoutes.SETTINGS : (ctx) => SettingsTelas(settings, _filterMeals),
        
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
