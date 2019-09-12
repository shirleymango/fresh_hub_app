import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sunnyside_1.dart';
import 'sunnyside_2.dart';
import 'kashmere_1.dart';
import 'kashmere_2.dart';
import 'sunnyside_3.dart';
import 'sunnyside_4.dart';
import 'kashmere_3.dart';
import 'kashmere_4.dart';
import 'sunnyside_5.dart';

const URL = "https://www.freshhubhouston.com/";

class PhotoHub extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          body: getListView(context),
        )
    );
  }
}

Widget getListView(BuildContext context) {
  var listView = ListView(
      children: <Widget>[
        new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new produceImage(),
              VerticalPadding(
                color: Colors.transparent,
              ),
              Text("Fresh Hub",
                style: TextStyle(fontFamily: 'Abril Fatface', fontSize: 50),
              ),
              VerticalPadding(
                color: Colors.transparent,
              ),
              Text("Mission of Fresh Hub: Our aim is to provide fresh, nutritional food to Houstonians in food deserts.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Questrial'),
                  textAlign: TextAlign.center),
              VerticalPadding(
                color: Colors.transparent,
              ),
              Text("Click on the button below to visit our website.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Questrial'),
                  textAlign: TextAlign.center),
              Website(),
              VerticalPadding(
                color: Colors.transparent,
              ),
              Text("Click on the buttons below to see photos and videos. Go to the navigation bar to check out more cool features.",
                  textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Questrial')),
              VerticalPadding(
                color: Colors.transparent,
              ),
              Text("EVENT PHOTOS", style: TextStyle(decoration: TextDecoration.underline, fontFamily: 'Abril Fatface', fontSize: 30)),
              VerticalPadding(
                color: Colors.transparent,
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sunnyside_5()));
                },
                child: Text(
                  "Sunnyside 8/12/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              // Added 4
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kashmere_4()));
                },
                child: Text(
                  "Kashmere 6/14/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              // Added 3
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sunnyside_4()));
                },
                child: Text(
                  "Sunnyside 5/18/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              // Added 2
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kashmere_3()));
                },
                child: Text(
                  "Kashmere 4/19/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              // Added 1
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sunnyside_3()));
                },
                child: Text(
                  "Sunnyside 3/11/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kashmere_2()));
                },
                child: Text(
                  "Kashmere 2/15/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sunnyside_2()));
                },
                child: Text(
                  "Sunnyside 1/19/19",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kashmere_1()));
                },
                child: Text(
                  "Kashmere 12/27/18",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sunnyside_1()));
                },
                child: Text(
                  "Sunnyside 11/19/18",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ]
        )
      ]
  );

  return listView;
}

class produceImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/produce.jpg');
    var image = new Image(image: assetsImage, width: 415, height: 250.0);
    return new Container(child: image);
  }
}
class groupPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/grouppic.jpg');
    var image = new Image(image: assetsImage, width: 619.9, height: 250.0);
    return new Container(child: image);
  }
}

class groupPic2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/grouppic2.jpg');
    var image = new Image(image: assetsImage, width: 619.9, height: 300);
    return new Container(child: image);
  }
}

class VerticalPadding extends StatelessWidget {
  VerticalPadding({
    @required this.child,
    this.padding = 8.0,
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

class Website extends StatefulWidget{
  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website>{
  Future launchURL(String url) async {
    if (await canLaunch(url))
      await launch(url, forceSafariVC: true, forceWebView: true);
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