import 'package:flutter/material.dart';
import 'package:frontend/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationState();
}

// TODO: are colors neccessary? We got the color swatch!!!
class _AuthenticationState extends State<Authenticate> {
  double _padding = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_padding),
              child: Text(
                "Vegan Klischee Adé",
                style: TextStyle(
                    color: Colors.green[100],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(_padding),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(_padding),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "User Mail"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(_padding),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
              ),
            ),
            Container(
              height: 30,
              // TODO: implement password recovery
              child: FlatButton(
                onPressed: null,
                child: Text("Forgot Password?"),
                textColor: Colors.green[300],
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.all(_padding),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.green[400],
                onPressed: () async =>
                    Auth.signInAnonymous().then((user) => null),
                child: Text("Sign in anonomously"),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No account?"),
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      "Sign up!",
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.green[300],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class _AuthenticationController {}
