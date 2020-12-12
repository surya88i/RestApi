import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/api/RestApi.dart';
import 'package:restapi/api/Photo.dart';

Future<List<Photo>> fetchData(http.Client http) async {
  final response =
      await http.get("https://jsonplaceholder.typicode.com/photos");
  print(response.body);
  return compute(parseData, response.body);
}

List<Photo> parseData(String responseBody) {
  final parse = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parse.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Model extends StatefulWidget {
  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder<List<Photo>>(
        future: fetchData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) print(snapshot.error);

          return snapshot.hasData
              ? RestApi(photo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
