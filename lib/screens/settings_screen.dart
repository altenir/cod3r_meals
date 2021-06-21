import 'package:flutter/material.dart';

import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    dynamic onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
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
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem Glúten',
                'Só exibe refeições sem glúten!',
                settings.isGlutenFree,
                (value) {
                  setState(() {
                    settings.isGlutenFree = value;
                    print(settings.isGlutenFree);
                  });
                },
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose!',
                settings.isLactoseFree,
                (value) {
                  setState(() {
                    settings.isLactoseFree = value;
                  });
                },
              ),
              _createSwitch(
                'Vegana',
                'Só exibe refeições veganas!',
                settings.isVegan,
                (value) {
                  setState(() {
                    settings.isVegan = value;
                  });
                },
              ),
              _createSwitch(
                'Vegetariana',
                'Só exibe refeições vegetariana!',
                settings.isVegetarian,
                (value) {
                  setState(() {
                    settings.isVegetarian = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
