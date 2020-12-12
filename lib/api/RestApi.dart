import 'package:flutter/material.dart';
import 'package:restapi/api/Photo.dart';
import 'package:restapi/search/search.dart';

class RestApi extends StatefulWidget{
  final List<Photo> photo;
  RestApi({Key key,this.photo}):super(key: key);

  @override
  _RestApiState createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text('Rest API With Search'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  showSearch(context: context, delegate: DataSearch(photo: widget.photo));
                });
              })
        ],
      ),
          body: ListView.builder(
          itemCount:widget.photo.length,
          itemBuilder:(context,index){
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:NetworkImage('${widget.photo[index].thumnailUrl}'),
                ),
                title: Text('${widget.photo[index].title}'),
                subtitle: Text('${widget.photo[index].url}'),
              ),
            );
          }
      ),
    );
  }
}
