import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/services/auth.dart';
import 'package:frontend/views/auth/authenticate.dart';
import 'package:frontend/views/widgetContainer/widgetcontainer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
        value: Auth.user,
        child: new MaterialApp(
          title: Config.title,
          theme: new ThemeData(
              primarySwatch: Config.primaryColorSwatch,
              accentColor: Config.secondaryColorSwatch),
          home: MainWrapper(),
        ));
  }
}

class MainWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseUser _user = Provider.of<FirebaseUser>(context);

    if (_user != null) {
      print(_user);
      return WidgetContainer();
    } else
      return Authenticate();
  }
}
