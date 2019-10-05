import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

const URL = "https://docs.google.com/forms/d/e/1FAIpQLSeB726Rr2ZGS2QZuo8d7xi-rwTDKT4tPTmjP6_DVYqSwyu4PA/viewform";


void main() => runApp(InformationHub());

class InformationHub extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      
      title: 'Welcome to the Information Hub!',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Information Hub'),
        ),
        body: getListView(),
      ),
    );
  }
}


Widget getListView(){
  var info = ListView(
    children:<Widget>[

      //# Info on nutrition labels
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            child:
            Text(
                'Reading a Nutrition Label',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          new Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/NutritionLabel.jpg',
                            width: 189.0,
                            height: 350.0,
                          ),
                        ]
                    ),
                    Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              '1. This section of the label will tell you the '
                                  'size of a single serving and the total '
                                  'number of servings per package. ',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              softWrap: true,
                            ),
                            Text(
                              '2. This section of the label lists the number '
                                  'of calories for each serving and the number '
                                  'of calories from fat per serving. The number '
                                  ' of servings you eat determine the number '
                                  'of calories you are consuming.',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              softWrap: true,
                            ),
                            Text(
                              '3. In this section, saturated fat and sodium '
                                  'should be limited in your daily diet. Trans '
                                  'fat should be eliminated. On the other hand ,'
                                  'protein and dietary fiber are good for you '
                                  'and should be included in your daily diet.',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              softWrap: true,
                            ),
                            Text(
                              '4. This section lists the minerals you '
                                  'are taking in. Vitamin A, Vitamin C, calcium, '
                                  'and iron are good for you and should be included'
                                  'in your daily diet.',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              softWrap: true,
                            ),
                            Text(
                              '5. This section includes the % Daily Value (DV). '
                                  'The DV tells you the percentage of each nutrient '
                                  'in a serving, in terms of the daily recommended '
                                  'amount of each nutrient.',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                              softWrap: true,
                            ),
                          ],

                        )


                    )

                  ]
              )
          )
        ],
      ),

      //# Info on food groups
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            child:
            Text(
                'Understanding Food Groups',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          new Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/FoodGroups2.jpg',
                              width: 600.0,
                              height: 200.0,
                            ),
                          ),
                          Text(
                            'There are five food groups:',
                          ),
                          Text(
                            '1. Fruits: fresh, canned, pureed, frozen, dried, etc.',
                          ),
                          Text(
                            '2. Vegetables: raw, cooked, fresh, frozen, canned, etc.',
                          ),
                          Text(
                            '3. Grains: wheat, rice, oats, cornmeal, barley, bread, pasta, '
                                'oatmeal, breakfast cereals, tortillas, and grits, etc. '
                                'There are two type of grain: whole grains which contain '
                                'the entire grain kernel and refined grains that have been '
                                'processed causing dietary fiber, iron, and many vitamins to '
                                'be removed.',
                          ),
                          Text(
                            '4. Proteins: meat, poultry, seafood, beans, peas, eggs, soy, nuts, etc.',
                          ),
                          Text(
                            '5. Dairy: milk products like milk, yogurt, and cheese. Dairy choices are '
                                'recommended to be fat-free or low-fat.',

                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/FoodPlate.png',
                              width: 600.0,
                              height: 200.0,
                            ),
                          ),
                          Text(
                            '1. It is recommended that half of your plate be made up of fruits and vegetables. '
                                'Make sure to choose fruits and vegetables with a lot of color. Also, potatoes '
                                'should not be substituted in for other vegetables.',
                          ),
                          Text(
                            '2. Whole grains should take up a quarter of your plate.' ,
                          ),
                          Text(
                            '3. Protein should take up the last quarter of your plate.',
                          ),
                          Text(
                            '4. Use healthy vegetable oils like olive oils. Avoid oils that contain trans fat or '
                                'are partially hydrogenated.',
                          ),
                          Text(
                            '5. When choosing a beverage, choose water, coffee, tea or dairy products. Avoid sugary '
                                'beverages.',
                          ),


                        ]
                    ),
                    Container(
                        padding: const EdgeInsets.all(20.0),
                        child:
                        Text(
                          'Take Our Survey Here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        )
                    )


                  ]
              )
          )
        ],
      ),
      Survey(),
    ],


  );
  return info;
}


//# Survey Button

class Survey extends StatefulWidget{
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey>{
  Future launchURL(String url) async {
    if (await canLaunch(url))
      await launch(url, forceSafariVC: true, forceWebView: false);
  }

  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          RaisedButton(
            child: Text("Open Link"),
            color: Colors.blue,
            splashColor: Colors.orange,
            onPressed: (){
              launchURL(URL);
            },
          )
        ]
    );
  }
}