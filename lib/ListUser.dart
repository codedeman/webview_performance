import "package:flutter/material.dart";

import 'dart:async';


class ListUser extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: ListUserPage()
    );
  }
}

class ListUserPage extends StatelessWidget {
  final List<String> items = ["What the fuck","Fuck the what","Fuck the what","I'm so tired"] ;



//  ListUserPage({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
//     title: Text("I don't know"),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fuck you"),
        ),
        body:  ListView.builder(
          itemCount: items.length,
            itemBuilder:(context,index) {
          return ListTile(

            title: Text('${items[index]}'),

          );
        }
        ),
      ),

   );


  }

  
}