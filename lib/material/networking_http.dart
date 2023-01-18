import 'dart:convert';

import 'package:bootcamp_material/material/16_networking_http.dart';
import 'package:bootcamp_material/material/module17_resources/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String localip = "192.168.137.164:8082";

Future<http.Response> getData() async {
  var result = await http.get(Uri.parse("http://$localip/api/user/getAll"));
  print(result.body);
  return result;
}

Future<http.Response> postData(Map<String, dynamic> data) async {
  var result = await http.post(Uri.parse("http://$localip/api/user/insert"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: json.encode(data));
  // print(result.statusCode);
  return result;
}

Future<http.Response> updateData(int id, Map<String, dynamic> data) async {
  print(id);
  var result = await http.put(
      Uri.parse("http://$localip/api/user/update/${id}"),
      body: json.encode(data));
  print(result.statusCode);
  return result;
}

Future<http.Response> deleteData(int id) async {
  var result = await http.delete(
    Uri.parse("http://$localip/api/user/delete/${id}"),
  );
  print(result.statusCode);
  return result;
}

class UsingLocalAPI extends StatelessWidget {
  UsingLocalAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetworkinghttpApp(),
    );
  }
}

class NetworkinghttpApp extends StatefulWidget {
  NetworkinghttpApp({super.key});

  @override
  State<NetworkinghttpApp> createState() => _NetworkinghttpAppState();
}

class _NetworkinghttpAppState extends State<NetworkinghttpApp> {
  var data = getData();

  @override
  Widget build(BuildContext context) {
    final add1 = TextEditingController();
    final add2 = TextEditingController();
    final add3 = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Flutter x Spring"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String nama = "";
              String email = "";
              int? gender = 0;
              return AlertDialog(
                content: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            nama = value;
                          },
                          decoration: InputDecoration(label: Text("name")),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(label: Text("email")),
                        ),
                        RadioListTile(
                          title: Text("Male"),
                          value: 1,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        RadioListTile(
                            title: Text("Female"),
                            value: 0,
                            groupValue: gender,
                            onChanged: ((value) {
                              setState(() {
                                gender = value;
                              });
                            }))
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        await postData(
                            {"nama": nama, "email": email, "gender": gender});
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text("Submit"))
                ],
              );
            },
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<http.Response>(
        // future: data,
        future: getData(),
        builder: (context, snapshot) {
          final add1 = TextEditingController();
          final add2 = TextEditingController();
          final add3 = TextEditingController();
          if (snapshot.hasData) {
            List<dynamic> json = jsonDecode(snapshot.data!.body);
            return ListView.builder(
              itemCount: json.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${json[index]["nama"][0] ?? ''}"),
                  ),
                  title: Text(json[index]["nama"] ?? ''),
                  subtitle: Text(json[index]["email"] ?? ''),
                  onTap: () {},
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                add1.text = json[index]["nama"];
                                add2.text = json[index]["email"];
                                var genders = json[index]["gender"];

                                int? gender = 0;
                                // gender = json[index]["gender"];
                                return AlertDialog(
                                  content: Container(
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: add1,
                                            decoration: InputDecoration(
                                                label: Text("name")),
                                          ),
                                          TextFormField(
                                            controller: add2,
                                            decoration: InputDecoration(
                                                label: Text("email")),
                                          ),
                                          RadioListTile(
                                            title: Text("Male"),
                                            value: genders == "Male" ? 0 : 1,
                                            groupValue: gender,
                                            onChanged: (value) {
                                              setState(() {
                                                genders = value;
                                              });
                                            },
                                          ),
                                          RadioListTile(
                                              title: Text("Female"),
                                              value:
                                                  genders == "Female" ? 0 : 1,
                                              groupValue: gender,
                                              onChanged: ((value) {
                                                setState(() {
                                                  genders = value;
                                                });
                                              }))
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          updateData(json[index]["id"], {
                                            "nama": add1.text,
                                            "email": add2.text,
                                            "gender": gender,
                                          });
                                          add1.clear();
                                          add2.clear();
                                          add3.clear();
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Text("Submit"))
                                  ],
                                );
                              },
                            );
                            // updateData(json[index]["id"]);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () async {
                            await deleteData(json[index]["id"]);
                            setState(() {});
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
    );
  }
}
