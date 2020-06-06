import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';

import 'views/recipe-detail/recipe-detail.dart';

void main() {
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Config.title,
      theme: new ThemeData(
        primarySwatch: Config.primaryColorSwatch,
        accentColor: Config.secondaryColorSwatch
      ),
      home: new WidgetContainer(),
    );
  }
}

class WidgetContainer extends StatefulWidget {
  WidgetContainer({Key key}) : super(key: key);

  final Map<int, Widget> _widgetOptions = {
    0: RecipeDetailPage(),
    1: RecipeDetailPage()
  };

  final List<BottomNavigationBarItem> _bottomNavigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood),
      title: Text("Rezepte")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood),
      title: Text("Rezepte")
    )
  ];

  @override
  _WidgetContainerState createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: widget._widgetOptions[_selectedIndex]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: widget._bottomNavigationItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
      )
    );
  }
}
