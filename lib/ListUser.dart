import 'dart:convert';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'package:webview/model/User.dart';
import 'package:http/http.dart' as http;


class ListUserPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: ListUser(title: "Load list user")
    );
  }

}
Future<List<User>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

List<User> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

class ListUser extends StatelessWidget {
  final String title;
  ListUser({Key key, this.title}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("List Beneficiar"),

        ),
        body: FutureBuilder<List<User>>(
          future: fetchPhotos(http.Client()),
          builder: (context,snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ?UserList(userList: snapshot.data)
                :Center(child: CircularProgressIndicator());
          },
        ),

    );
//    return MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//
//          primarySwatch: Colors.blue,
//        ),
//
//
//    );
  }
}

//
//class ListUserPage extends StatelessWidget {
//  final List<String> items = ["What the fuck","Fuck the what","Fuck the what","I'm so tired"] ;
////  ListUserPage({Key key, @required this.items}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//   return new MaterialApp(
////     title: Text("I don't know"),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Fuck you"),
//        ),
//        body:  ListView.builder(
//          itemCount: items.length,
//            itemBuilder:(context,index) {
//          return ListTile(
//
//            title: Text('${items[index]}'),
//
//          );
//        }
//        ),
//      ),
//
//   );
//
//
//  }
//
//
//}







class UserList extends StatelessWidget {

  final List<User> userList;
  UserList({Key key, this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context,index){
          return Image.network(userList[index].thumbnailUrl);
        });
  }


}