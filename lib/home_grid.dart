import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'PhotoHub.dart' as first;
import 'PhotoHub.dart';

const URL = "https://docs.google.com/forms/d/e/1FAIpQLSeB726Rr2ZGS2QZuo8d7xi-rwTDKT4tPTmjP6_DVYqSwyu4PA/viewform";
const covidURL = "https://www.freshhubhouston.com/covid-19-support";

class home_grid extends StatelessWidget {

  final TabController controller;

  home_grid(this.controller);

  @override
  Widget build(BuildContext context) {
    final title = 'Fresh Hub';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Image.asset('assets/images/produce.jpg'),
        //   backgroundColor: Colors.transparent,
        // ),
        body: getHomeGridView(context, controller),
              ),
            );
          }
        
          
}

Widget getHomeGridView(BuildContext context, TabController controller) {
       var grid = GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                    children: List.generate(6, (index) {
                      return Container(
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: GridTile(
                            
                            footer: Text(
                              
                              getText(index),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Questrial', fontSize: 15),
                            ),
                            // header: Text(
                            //   'SubItem $index',
                            //   textAlign: TextAlign.center,
                            // ),
                            
                            child: InkResponse (
                              child: getIcon(index),//Icon(Icons.access_alarm,
                                //size: 40.0, color: Colors.white30),
                              onTap:  () => gotoTab(index, controller) ),//controller.animateTo(index+1) ),  
                                )
                          ),

                        //color: Colors.blue[400],
                        margin: EdgeInsets.all(5.0),
                      );
                    }));

      var column_view = Column (
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Image.asset('assets/images/produce.jpg'),
        VerticalPaddingThin(),
        Text("Fresh Hub",
                style: TextStyle(fontFamily: 'Abril Fatface', fontSize: 50),
              ),
              // VerticalPadding(
              //   color: Colors.transparent,
              // ),
              Text("Mission: Our aim is to provide fresh, nutritional food to Houstonians in food deserts.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Questrial', fontSize: 15),
                  textAlign: TextAlign.center),
        VerticalPaddingThin(padding: 10,),
        // Text("COVID-19 Update: Please contact us if you have difficulties accessing fresh food during the pandemic.",
        //           style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Questrial', fontSize: 20),
        //           textAlign: TextAlign.center),

        new Center(
          child: new RichText(
            textAlign: TextAlign.center,
            text: 
            new TextSpan(
              children: [
                new TextSpan(
                  text: "COVID-19 Update: Please ",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Questrial', fontSize: 20),                  
                ),
                new TextSpan(
                  text: 'contact us',
                  style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Questrial', fontSize: 20, decoration: TextDecoration.underline),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () { launch(covidURL);
                  },
                ),
                 new TextSpan(
                  text: " if you are in need of accessing fresh food during the pandemic.",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Questrial', fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        
        Flexible(child: grid),

      ],);

      return column_view;
}

Icon getIcon(int index) {
  switch (index) {
    case(0) : { return Icon(Icons.camera_alt, size: 50.0, color: Colors.blue);   }
    break;
    case(1) : { return Icon(Icons.calendar_today, size: 50.0, color: Colors.blue);   }
    break;
    case(2) : { return Icon(Icons.add_location, size: 50.0, color: Colors.blue);   }
    break;
    case(3) : { return Icon(Icons.library_books, size: 50.0, color: Colors.blue);   }
    break;
    case(4) : { return Icon(Icons.question_answer, size: 50.0, color: Colors.blue);  }
    break;
    case(5) : { return Icon(Icons.queue, size: 50.0, color: Colors.blue);   }
    break;
  //new Tab(icon: new Icon(Icons.home)),
                // new Tab(icon: new Icon(Icons.camera_alt)),
                // new Tab(icon: new Icon(Icons.calendar_today)),
                // new Tab(icon: new Icon(Icons.library_books)),
                // new Tab(icon: new Icon(Icons.question_answer)),
                // new Tab(icon: new Icon(Icons.add_location)),
  }
}

gotoTab(int index, TabController controller) {
  switch (index) {
    case(0) : { controller.animateTo(index + 1);   }
    break;
    case(1) : { controller.animateTo(index + 1);   }
    break;
    case(2) : { controller.animateTo(5);   }
    break;
    case(3) : { controller.animateTo(index);   }
    break;
    case(4) : { controller.animateTo(index);  }
    break;
    case(5) : { launch(URL, forceSafariVC: true, forceWebView: false);   }
    break;
  }  
}

String getText(int index) {

  String title = "";

  switch (index) {
    case(0) : { title = "Photo Hub";   }
    break;
    case(1) : { title = "Calendar";   }
    break;
    case(2) : { title = "Event Map";   }
    break;
    case(3) : { title = "Recipe Hub";   }
    break;
    case(4) : { title = "Info Hub";   }
    break;
    case(5) : { title = "Survey Hub";   }
    break;
  }  

  return title;
}

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

class VerticalPaddingThin extends StatelessWidget {
  VerticalPaddingThin({
    @required this.child,
    this.padding = 5.0,
    this.color = Colors.transparent,
  });
  final double padding;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}