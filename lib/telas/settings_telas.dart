import 'package:flutter/material.dart';

import '../models/settings.dart';

import '../components/main_drawer.dart';

class SettingsTelas extends StatefulWidget {

  final Settings settings;

  final Function(Settings) onSettingsChanged;

  const SettingsTelas(this.settings,this.onSettingsChanged);

  @override
  _SettingsTelasState createState() => _SettingsTelasState();
}

class _SettingsTelasState extends State<SettingsTelas> {
  Settings settings;

  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged
  ){
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glutén', 
                  'Só exibir refeições sem Glutén', 
                  settings.isGlutenFree, 
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose', 
                  'Só exibir refeições sem Lactose', 
                  settings.isLactoseFree, 
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana', 
                  'Só exibir refeições veganas!', 
                  settings.isVegan, 
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarianas', 
                  'Só exibir refeições vegetarianas', 
                  settings.isVegetariano, 
                  (value) => setState(() => settings.isVegetariano = value),
                ),
              ],
            ),)
        ],
      )
      
    );
  }
}