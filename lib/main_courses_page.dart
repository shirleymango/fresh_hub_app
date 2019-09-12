import 'package:flutter/material.dart';
import 'dart:convert';

class MainCoursesPage extends StatelessWidget{

  showSummary(BuildContext context, String name, String indregients, String instructions) {
    showDialog(
        context: context,
        builder: (context) => Center(
          child: SingleChildScrollView (
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Padding(padding: const EdgeInsets.all(3.0),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),
                            ),
                            TextSpan(
                              text: "\n\nIngredients: \n",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: indregients,
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                            TextSpan(
                              text: "\n\nInstructions: \n",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: instructions,
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                          ],
                        ),
                      )
                    ]
                ),
              ),
            ),
          ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Courses")),
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context){
    return Container(
      child: FutureBuilder(
          future: DefaultAssetBundle
              .of(context)
              .loadString('load_json/maincourses.json'),
          builder: (context, snapshot){
            var mydataa = jsonDecode(snapshot.data.toString());
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.0
                ),
                itemCount: 10,
                itemBuilder: (context, index) => InkWell(
                  child: Card(
                    color: Colors.lightBlueAccent,
                    child: GridTile(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mydataa[index]['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap:(){
                    showSummary(context, mydataa[index]['name'], mydataa[index]['ingredients'], mydataa[index]['instructions']);
                  },
                )
            );
          }
      ),
    );
  }
}