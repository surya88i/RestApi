import 'package:flutter/material.dart';

class SearchData extends StatelessWidget {
  final String title;
  SearchData({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Center(
        child: Text(title,style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
