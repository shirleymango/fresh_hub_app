import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart' show DateFormat;
//import 'local_notications_helper.dart';
//import 'package:projectname33/page/second_page.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  var eventDetailMaps = {
    new DateTime(2018,11,19,11) : "Sunnyside Multi-Service Center",
    new DateTime(2018,12,27,11) : "Kashmere Multi-Service Center",
    new DateTime(2019,1,19,11) : "Sunnyside Multi-Service Center",
    new DateTime(2019,2,15,11) : "Kashmere Multi-Service Center",
    new DateTime(2019,3,11,11) : "Sunnyside Multi-Service Center",
    new DateTime(2019,4,19,11) : "Kashmere Multi-Service Center",
    new DateTime(2019,5,18,11) : "Sunnyside Multi-Service Center",
    new DateTime(2019,6,14,11) : "Kashmere Multi-Service Center",
    new DateTime(2019,8,12,11) : "Sunnyside Multi-Service Center",
    new DateTime(2019,9,21,11) : "Sunnyside Multi-Service Center",
    new DateTime(2019,10,11,15) : "Kashmere Multi-Service Center",
    new DateTime(2019,11,25,11)  : "Sunnyside Multi-Service Center",
    new DateTime(2019,12,23,11) : "Kashmere Multi-Service Center",
    new DateTime(2020,1,17,15) : "Kashmere Multi-Service Center",
    new DateTime(2020,2,15,11) : "Sunnyside Multi-Service Center"

    };

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);

    notifications.cancelAll();
    
  var notificationId = 1;
  for (var eventDate in eventDetailMaps.entries) {
    if (eventDate.key.isAfter(DateTime.now()))
    {
      scheduleWeekAheadEventNotification(eventDate, notificationId);
    } 
          notificationId = notificationId + 1;
  }
            
  }
          
      
        void scheduleWeekAheadEventNotification(MapEntry<DateTime, String> eventDate, int notificationId ) {
      
          var androidPlatformChannelSpecifics =
              new AndroidNotificationDetails('your other channel id',
                  'your other channel name', 'your other channel description');
          var iOSPlatformChannelSpecifics =
              new IOSNotificationDetails();
          NotificationDetails platformChannelSpecifics = new NotificationDetails(
              androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      
          var tagline = "Free Groceries";
          var weekDay = DateFormat('EEEE').format(eventDate.key);
          var dateDisp = DateFormat('MM/dd').format(eventDate.key);


          var notificationWeekTitle = tagline + " - " + "Next " + weekDay + " (" + dateDisp + ")";
          var notificationOneDayTitle = tagline + " - " + "Tomorrow (" + dateDisp + ") at " + DateFormat('hh:mm a').format(eventDate.key);
          var notificationSameDayTitle = tagline + " - " + "Today (" + dateDisp + ") at " + DateFormat('hh:mm a').format(eventDate.key);
      
          var notificationWeekBody = "Next " + weekDay + ", join us";
          notificationWeekBody = notificationWeekBody + " at " + eventDate.value;
          notificationWeekBody = notificationWeekBody + " " + DateFormat('hh:mm').format(eventDate.key) + " - " + DateFormat('hh:mm').format(eventDate.key.add(new Duration(hours: 2)));
          notificationWeekBody = notificationWeekBody + " PM for a Fresh Hub event.";

          var notificationOneDayBody = "Tomorrow at " + DateFormat('hh:mm a ').format(eventDate.key) + ", join us";
          notificationOneDayBody = notificationOneDayBody + " at " + eventDate.value;
          notificationOneDayBody = notificationOneDayBody + " " + DateFormat('hh:mm').format(eventDate.key) + " - " + DateFormat('hh:mm').format(eventDate.key.add(new Duration(hours: 2)));
          notificationOneDayBody = notificationOneDayBody + " PM for a Fresh Hub event.";

          var notificationSameDayBody = "Today at " + DateFormat('hh:mm a').format(eventDate.key) + ", join us";
          notificationSameDayBody = notificationSameDayBody + " at " + eventDate.value;
          notificationSameDayBody = notificationSameDayBody + " " + DateFormat('hh:mm').format(eventDate.key) + " - " + DateFormat('hh:mm').format(eventDate.key.add(new Duration(hours: 2)));
          notificationSameDayBody = notificationSameDayBody + " PM for a Fresh Hub event.";
      
          var sunnysideAddress = """9314 Cullen Blvd
      Houston, TX 77051""";
          var kashmereAddress = """4802 Lockwood Dr 
      Houston, TX 77026""";
      
          var payloadJson = {
            "address" : eventDate.value.contains("Sunny") ? sunnysideAddress : kashmereAddress,
            "eventDate" : DateFormat('MM/dd/yyyy').format(eventDate.key),
            "eventFromTime" : DateFormat('hh:mm').format(eventDate.key),
            "eventToTime" : DateFormat('hh:mm').format(eventDate.key.add(new Duration(hours: 2))),
            "location" : eventDate.value
          };

          notifications.schedule(10 + notificationId, notificationWeekTitle, notificationWeekBody, eventDate.key.add(new Duration(days: -7)), platformChannelSpecifics, payload: jsonEncode(payloadJson));
          notifications.schedule(20 + notificationId, notificationOneDayTitle, notificationOneDayBody, eventDate.key.add(new Duration(days: -1)), platformChannelSpecifics, payload: jsonEncode(payloadJson));
          notifications.schedule(30 + notificationId, notificationSameDayTitle, notificationSameDayBody, eventDate.key.add(new Duration(hours: -3)), platformChannelSpecifics, payload: jsonEncode(payloadJson));

          // debug
          //notifications.schedule(notificationId, notificationWeekTitle, notificationWeekBody, new DateTime.now().add(new Duration(seconds: 0+notificationId*1)), platformChannelSpecifics, payload: jsonEncode(payloadJson));
               
        }
              
              
              Future onSelectNotification(String payload) async => await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
                  );
            
              @override
              Widget build(BuildContext context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                      // child: 
                      //   RaisedButton(
                      //     child: Text('Show notification'),
                      //     onPressed: () => showOngoingNotification(notifications,
                      //         title: 'Tite', body: 'Body'),
                      //   ),
                        // RaisedButton(
                        //   child: Text('Replace notification'),
                        //   onPressed: () => showOngoingNotification(notifications,
                        //       title: 'ReplacedTitle', body: 'ReplacedBody'),
                        // ),
                        // RaisedButton(
                        //   child: Text('Other notification'),
                        //   onPressed: () => showOngoingNotification(notifications,
                        //       title: 'OtherTitle', body: 'OtherBody', id: 20),
                        // ),
                        // const SizedBox(height: 32),
                        // title('Feautures'),
                        // RaisedButton(
                        //   child: Text('Silent notification'),
                        //   onPressed: () => showSilentNotification(notifications,
                        //       title: 'SilentTitle', body: 'SilentBody', id: 30),
                        // ),
                        // const SizedBox(height: 32),
                        // title('Cancel'),
                        // RaisedButton(
                        //   child: Text('Cancel all notification'),
                        //   onPressed: notifications.cancelAll,
                        // ),
            
                  );
            
              Widget title(String text) => Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center,
                    ),
                  );
      
        
      

}

class SecondPage extends StatelessWidget {
  final String payload;
  
  const SecondPage({
    @required this.payload,
    Key key,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: "\n" + jsonDecode(payload)["location"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                                  
                              ),
                            ),
                            TextSpan(
                              text: "\n\nDate: ",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: jsonDecode(payload)["eventDate"],
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                            TextSpan(
                              text: "\nTime: ",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: jsonDecode(payload)["eventFromTime"] + " - " + jsonDecode(payload)["eventToTime"] + " PM",
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                            TextSpan(
                              text: "\nAddress: \n",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: jsonDecode(payload)["address"] + "\n",
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                            // TextSpan(
                            //   text: "\n\nContact: ",
                            //   style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            // ),
                            // TextSpan(
                            //     text: contactNo,
                            //     style: TextStyle(color : Colors.black, fontSize: 20)
                            // ),
                            
                          ],
                        ),
                      )
                    ],
          ),
        ),
      );
}
