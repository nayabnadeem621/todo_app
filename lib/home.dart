import 'package:flutter/material.dart';

class Todo extends StatefulWidget {

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
var output="";
List<dynamic> lst=[1,2,3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(
  title: Text("My TODO app"),
  actions: [
    IconButton( 
      onPressed: () {},
      icon: Icon(Icons.exit_to_app),
    )
  ],
),
      body: ListView.builder(
        itemCount: lst.length,
         itemBuilder: (context,index) {
        return Container(
          height: 65,
          color: Colors.amber,
          margin: EdgeInsets.only(top: 15),
          child: ListTile(
            title: Text("${lst[index]}"),
            subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Subtitle"),
      ],
    ),
            trailing: Container(
              width: 50,
              child: Row(
                children: [
                  GestureDetector (onTap: (){
                       showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            onChanged: (value){
              output= value;
            },
          ),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            setState((){
              lst.replaceRange(index,index+1, {output});
            }
            );
            }, child: Text("Edit"))
          ],
        );
        });
                  }, child: Icon(Icons.edit)),
                  GestureDetector (onTap: (){
                    setState(() {
                    lst.removeAt(index);
                                  });
                  }, child: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        );
       },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Add Item"),
          content: TextField(
            onChanged: (value){
              output= value;
            },
          ),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            setState((){
              lst.add(output);
            }
            );
            }, child: Text("Add"))
          ],
        );
        });
      },child: Text("Add"),),
    );
  }
}