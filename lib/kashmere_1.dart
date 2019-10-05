import 'package:flutter/material.dart';
import 'main.dart';

class kashmere_1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          body: getListView(),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhotoHub()));
                  },
                  child: new Icon(Icons.arrow_back),
                ),
                Text("Kashmere 12/27/18"),
              ],
            ),
          ),
        )
    );
  }
}

Widget getListView() {
  var listView = ListView(
      children: <Widget>[
        new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              VerticalPadding(
                color: Colors.white,
              ),
              new kashmere1(),
              VerticalPadding(
                color: Colors.white,
              ),
              new kashmere2(),
              VerticalPadding(
                color: Colors.white,
              ),
              new kashmere3(),
            ]
        )
      ]
  );

  return listView;
}

class kashmere1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/kashmere1-2.jpg');
    var image = new Image(image: assetsImage, width: 619.9, height: 250.0);
    return new Container(child: image);
  }
}

class kashmere2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/kashmere1-1.jpg');
    var image = new Image(image: assetsImage, width: 619.9, height: 250.0);
    return new Container(child: image);
  }
}
class kashmere3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/kashmere1-3.jpg');
    var image = new Image(image: assetsImage, width: 619.9, height: 250.0);
    return new Container(child: image);
  }
}
class kashmere4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/images/kashmere1-4.jpg');
    var image = new Image(image: assetsImage, width: 619.9, height: 250.0);
    return new Container(child: image);
  }
}

class VerticalPadding extends StatelessWidget {
  VerticalPadding({
    @required this.child,
    this.padding = 8.0,
    this.color = Colors.white,
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