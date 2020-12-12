import 'package:flutter/material.dart';
import 'package:restapi/api/Photo.dart';
import 'package:restapi/search/SearchData.dart';

class DataSearch extends SearchDelegate {
  final List<Photo> photo;
  DataSearch({this.photo});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    
    final suggesionList=query.isEmpty?photo:photo.where((p) => p.title.startsWith(query)).toList();
    return suggesionList.isEmpty?Center(child: Text("No Data Found '$query'")):ListView.builder(
        itemCount: photo.length,
        itemBuilder: (context, index) {
         final Photo photo=suggesionList[index];
          return Card(
            child: ListTile(
              title: RichText(
              text: TextSpan(
                text: photo.title.substring(0,query.length),
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: photo.title.substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  ),
                ]
              ),
              
            ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchData(title: photo.title)));
              },
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesionList=query.isEmpty?photo:photo.where((p) => p.title.startsWith(query)).toList();
    return suggesionList.isEmpty?Center(child: Text("No Data Found '$query'")):ListView.builder(
        itemCount: photo.length,
        itemBuilder: (context, index) {
           final Photo photo=suggesionList[index];
          return Card(
            child: ListTile(
              title: RichText(
              text: TextSpan(
                text: photo.title.substring(0,query.length),
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: photo.title.substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  ),
                ]
              ),
              
            ),
              onTap: () {
                showResults(context);
              },
            ),
          );
        });
  }
}
