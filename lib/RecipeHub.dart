import 'package:flutter/material.dart';
import 'appetizers_page.dart';
import 'main_courses_page.dart';
import 'desserts_page.dart';

void main(){
  runApp(RecipeHub());
}

final ThemeData _themeData = ThemeData(
  primaryColor: Colors.green
);

///Root MaterialApp
class RecipeHub extends StatefulWidget{
  @override
  _RecipeHubState createState() => _RecipeHubState();
}

class _RecipeHubState extends State<RecipeHub> {
  @override
  Widget build(BuildContext context) {
    ///var _routes = <String, WidgetBuilder>{
    ///  "/recipes" :  (BuildContext context) =>  new RecipeHubState(),
    /// };
    /// routes: _routes,
    /// 
    
    return Scaffold(
        body: Center(
          child: myCard(),
        )
    );
  }

  Widget myCard(){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Welcome to the Recipe Hub!",
                  style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green,
                  ),
                ),
                SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 50),
                  child: RaisedButton(
                    color: Colors.lightGreen,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> AppetizersPage())
                      );
                    },
                    child : Text(
                      "Appetizers",
                      style: TextStyle(fontSize: 30.0),
                    )
                  )
                ),
                SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 50),
                  child: RaisedButton(
                      color: Colors.lightGreen,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> MainCoursesPage())
                        );
                      },
                      child : Text(
                        "Main Courses",
                        style: TextStyle(fontSize: 30.0),
                      )
                  ),
                ),
                SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 50),
                  child: RaisedButton(
                    color: Colors.lightGreen,
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context)=> DessertsPage())
                        );
                    },
                    child : Text(
                      "Desserts",
                        style: TextStyle(fontSize: 30.0),
                    )
                  )
                ),

              ]
          )
      )
    );
  }
}