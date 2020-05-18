import 'package:flutter/material.dart';

import 'categorias_telas.dart';
import 'favoritas_telas.dart';

import '../components/main_drawer.dart';
import '../models/refeicao.dart';

class TabsTelas extends StatefulWidget {
  
  final List<Refeicao> favoriteMeals;

  const TabsTelas(this.favoriteMeals);

  @override
  _TabsTelasState createState() => _TabsTelasState();
}

class _TabsTelasState extends State<TabsTelas> {
  
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  void initState(){
    super.initState();
    _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriasTelas()},
    {'title': 'Meus Favoritos', 'screen': FavoritasTelas(widget.favoriteMeals)}   
  ];

  }

  _selectScreen(int index){
    setState((){
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(_screens[_selectedScreenIndex]['title']),        
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,        
        items: [
          BottomNavigationBarItem(            
            icon: Icon(Icons.category),
            title: Text('Categoria')
          ),
          BottomNavigationBarItem(            
            icon: Icon(Icons.star),
            title: Text('Favoritas')
          ),
        ],
      ),
    );
  }
}