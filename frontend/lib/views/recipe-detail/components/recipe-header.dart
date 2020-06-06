import 'package:flutter/material.dart';

class RecipeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(child: RecipeDifficulty()),
              Expanded(
                  child: FlatButton(
                onPressed: () => {}, // TODO: implement popup/routing
                child: Text("Komponente"),
              ))
            ],
          ),
        )
      ],
    );
  }
}

class RecipeDifficulty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(child: Icon(Icons.access_time), margin: const EdgeInsets.only(right: 5.0)),
        Container(child: Icon(Icons.access_time), margin: const EdgeInsets.only(right: 5.0)),
        Container(child: Icon(Icons.access_time), margin: const EdgeInsets.only(right: 5.0))
      ],
    );
  }
}
