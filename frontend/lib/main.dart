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
  @override
  _WidgetContainerState createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  final _WidgetContainerController _controller = _WidgetContainerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _controller.widgetOptions[_controller.selectedIndex]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _controller.bottomNavigationItems,
          currentIndex: _controller.selectedIndex,
          onTap: (index) => _controller.onItemTapped(index, this),
        )
      )
    );
  }
}

class _WidgetContainerController {
  final Map<int, Widget> widgetOptions = {
    0: RecipeDetailPage(),
    1: RecipeDetailPage()
  };

  final List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood),
      title: Text("Rezepte")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood),
      title: Text("Rezepte")
    )
  ];

  int selectedIndex = 0;

  void onItemTapped(int index, State state) {
    state.setState(() {
      selectedIndex = index;
    });
  }
}
