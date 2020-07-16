import 'package:flutter/material.dart';
import 'package:frontend/views/account/account.dart';
import 'package:frontend/views/recipe-detail/recipe-detail.dart';

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
                child: _controller.widgetOptions[_controller.selectedIndex]),
            bottomNavigationBar: BottomNavigationBar(
              items: _controller.bottomNavigationItems,
              currentIndex: _controller.selectedIndex,
              onTap: (index) => _controller.onItemTapped(index, this),
            )));
  }
}

class _WidgetContainerController {
  final Map<int, Widget> widgetOptions = {0: RecipeDetailPage(), 1: Account()};

  final List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text("Rezepte")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), title: Text("Account"))
  ];

  int selectedIndex = 0;

  void onItemTapped(int index, State state) {
    state.setState(() {
      selectedIndex = index;
    });
  }
}
