import 'package:flutter/material.dart';
import 'PhotoHub.dart' as first;
import 'Calendar.dart' as second;
import 'RecipeHub.dart' as third;
import 'Survey.dart' as fourth;
import 'Map.dart' as fifth;
import 'home_grid.dart' as home_grid;
import 'local_notification_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PhotoHub(title: "Photo Hub"),
      //home: home_grid.home_grid(),
    );
  }
}

class PhotoHub extends StatefulWidget {
  PhotoHub({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PhotoHubState createState() => _PhotoHubState();
}

class _PhotoHubState extends State<PhotoHub> with SingleTickerProviderStateMixin {

  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Fresh Hub", style: TextStyle(fontStyle: FontStyle.italic)),
      ),

      bottomNavigationBar: new Material(
          color: Colors.green,
          child: new TabBar(
              controller: controller,
              tabs: <Tab> [
                new Tab(icon: new Icon(Icons.home)),
                new Tab(icon: new Icon(Icons.camera_alt)),
                new Tab(icon: new Icon(Icons.calendar_today)),
                new Tab(icon: new Icon(Icons.library_books)),
                new Tab(icon: new Icon(Icons.question_answer)),
                new Tab(icon: new Icon(Icons.add_location)),
              ]
          )
      ),
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new home_grid.home_grid(controller),
            new first.PhotoHub(),
            new second.Calendar(),
            new third.RecipeHub(),
            new fourth.InformationHub(),
            new fifth.Map(),
          ]
      ),
    );
  }
}
