import 'package:flutter/material.dart';
import 'package:frontend/services/auth.dart';

class Account extends StatelessWidget {
  final double _padding = 10;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 20,
          alignment: Alignment.centerRight,
          child: FlatButton(
              onPressed: () async => Auth.signOut(),
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )),
        ),
        Container(
          padding: EdgeInsets.all(_padding),
          child: CircleAvatar(
            radius: 80,
            // TODO: dynamic image and name loading
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(_padding),
          child: Text(
            "Lars Leo Grätz",
            style: TextStyle(
                fontSize: 20, color: Colors.green[400], letterSpacing: 2.5),
          ),
        ),
        Container(
          height: 20,
          child: Divider(),
        )
      ],
    );
  }
}

//                SizedBox(
//                   height: 20.0,
//                   width: 200,
//                   child: Divider(
//                     color: Colors.teal[100],
//                   ),
//                 ),
//                 Text("Keep visiting protocoderspoint.com for more contents"),
//                 Card(
//                     color: Colors.white,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                     child: ListTile(
//                       leading: Icon(
//                         Icons.phone,
//                         color: Colors.teal[900],
//                       ),
//                       title: Text(
//                         '+91 85465XXX8XX',
//                         style:
//                             TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
//                       ),
//                     )),
//                 Card(
//                   color: Colors.white,
//                   margin:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.cake,
//                       color: Colors.teal[900],
//                     ),
//                     title: Text(
//                       '08-05-1995',
//                       style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
