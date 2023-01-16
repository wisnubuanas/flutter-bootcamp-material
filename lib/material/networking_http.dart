import 'dart:convert';

import 'package:bootcamp_material/material/16_networking_http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<http.Response> getData() async {
//   var result =
//       await http.get(Uri.parse("http://jsonplaceholder.typicode.com/users"));
//   print(result.body);
//   return result;
// }
Future<http.Response> postData() async {
  Map<String, dynamic> data = {
    "name": "jhon doe",
    "email": "postmethod@test.com"
  };
  var result = await http.post(
      Uri.parse("http://jsonplaceholder.typicode.com/users"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: json.encode(data));
  print(result.statusCode);
  return result;
}

Future<http.Response> updateData(int id) async {
  Map<String, dynamic> data = {
    "name": "jhon doe",
    "email": "postmethod@test.com"
  };
  var result = await http.put(
      Uri.parse("http://jsonplaceholder.typicode.com/users/${id}"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: json.encode(data));
  print(result.statusCode);
  return result;
}

Future<http.Response> deleteData(int id) async {
  var result = await http.delete(
    Uri.parse("http://jsonplaceholder.typicode.com/users/${id}"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
  );
  print(result.statusCode);
  return result;
}

class NetworkinghttpApp extends StatelessWidget {
  NetworkinghttpApp({super.key});

  var data = getData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            postData();
          },
        ),
        body: FutureBuilder<http.Response>(
          // future: data,
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> json = jsonDecode(snapshot.data!.body);
              return ListView.builder(
                itemCount: json.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(json[index]["name"]),
                    subtitle: Text(json[index]["email"]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              updateData(json[index]["id"]);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              deleteData(json[index]["id"]);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              );
              // if (snapshot.hasData) {
              //   return Text(snapshot.data!.body);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
