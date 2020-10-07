import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
class Calendar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'dooboolab flutter calendar',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CalendarThing(title: 'Event Calendar (shown as blue dots)'),
    );
  }
}

class CalendarThing extends StatefulWidget {
  CalendarThing({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalendarThing createState() => new _CalendarThing();
}

class _CalendarThing extends State<CalendarThing> {
  DateTime _currentDate = DateTime.now();
  String _currentMonth = '';
  List<DateTime> _markedDate = [];
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
        ),
  );

  Set<DateTime> ListOfDates = {
    new DateTime(2018,11,19),
    new DateTime(2018,12,27),
    new DateTime(2019,1,19),
    new DateTime(2019,2,15),
    new DateTime(2019,3,11),
    new DateTime(2019,4,19),
    new DateTime(2019,5,18),
    new DateTime(2019,6,14),
    new DateTime(2019,8,12),
    new DateTime(2019,9,21),
    new DateTime(2019,10,11),
    new DateTime(2019,11,25),
    new DateTime(2019,12,23),
    new DateTime(2020,1,17),
    new DateTime(2020,2,15),
    //new DateTime(2020,3,16),
    //new DateTime(2020,4,18),
    //new DateTime(2020,5,16),
    new DateTime(2020,5,5),
    new DateTime(2020,5,7),
    new DateTime(2020,5,12),
    new DateTime(2020,5,14),
    new DateTime(2020,5,19),
    new DateTime(2020,5,21),
    new DateTime(2020,5,26),
    new DateTime(2020,5,28),
    //june
    new DateTime(2020,6,2),
    new DateTime(2020,6,4),
    new DateTime(2020,6,9),
    new DateTime(2020,6,11),
    new DateTime(2020,6,16),
    new DateTime(2020,6,18),
    new DateTime(2020,6,23),
    new DateTime(2020,6,25),
    new DateTime(2020,6,30),
    new DateTime(2020,7,2),

    new DateTime(2020,9,4),
    new DateTime(2020,10,9),
    new DateTime(2020,11,23),
    new DateTime(2020,12,21),
    
  };
  EventList<Event> _markedDateMap = new EventList<Event>();

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    for( DateTime event in ListOfDates) {
      _markedDateMap.add(
          event,
          new Event(
            date: event,
            title: 'Fresh Hub Event',
            icon: _eventIcon,
          ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      //weekendTextStyle: TextStyle(
      //  color: Colors.red,
      //),
      thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
      //headerText: Container( /// Example for rendering custom header
      // child: Text('Custom Header'),
      //),
     // markedDates: _markedDate,
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate,

//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal:
      true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        showSummary(context, date);
        events.forEach((event) => print(event.title));
      },
      // weekendTextStyle: TextStyle(
      //  color: Colors.red,
      //
      // ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal:
      false, // null for not showing hidden events indicator
      showHeader: false,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: new DateTime(2018,1,1),
      maxSelectedDate: new DateTime(2050,1,1),
//      inactiveDateColor: Colors.black12,
      onCalendarChanged: (DateTime date) {
        this.setState(() => _currentMonth = DateFormat.yMMM().format(date));
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              //custom icon without header
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          _currentMonth,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        )),
                    FlatButton(
                      child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _currentDate=
                              _currentDate.subtract(Duration(days: 30));
                          _currentMonth =
                              DateFormat.yMMM().format(_currentDate);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _currentDate = _currentDate.add(Duration(days: 30));
                          _currentMonth =
                              DateFormat.yMMM().format(_currentDate);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }

showSummary(BuildContext context, DateTime date) {
   var eventDetailMaps = {
    new DateTime(2018,11,19) : "Sunnyside Multi-Service Center",
    new DateTime(2018,12,27) : "Kashmere Multi-Service Center",
    new DateTime(2019,1,19) : "Sunnyside Multi-Service Center",
    new DateTime(2019,2,15) : "Kashmere Multi-Service Center",
    new DateTime(2019,3,11) : "Sunnyside Multi-Service Center",
    new DateTime(2019,4,19) : "Kashmere Multi-Service Center",
    new DateTime(2019,5,18) : "Sunnyside Multi-Service Center",
    new DateTime(2019,6,14) : "Kashmere Multi-Service Center",
    new DateTime(2019,8,12) : "Sunnyside Multi-Service Center",
    new DateTime(2019,9,21) : "Sunnyside Multi-Service Center",
    new DateTime(2019,10,11) : "Kashmere Multi-Service Center",
    new DateTime(2019,11,25)  : "Sunnyside Multi-Service Center",
    new DateTime(2019,12,23) : "Kashmere Multi-Service Center",
    new DateTime(2020,1,17) : "Kashmere Multi-Service Center",
    new DateTime(2020,2,15) : "Sunnyside Multi-Service Center",
    //new DateTime(2020,3,16) : "Sunnyside Multi-Service Center",
    //new DateTime(2020,4,18) : "The Redford Apartments",
    //new DateTime(2020,5,16) : "Sunnyside Multi-Service Center"
    new DateTime(2020,5,5) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,7) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,12) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,14) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,19) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,21) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,26) : "Dinner On Us - Second Serving",
    new DateTime(2020,5,28) : "Dinner On Us - Second Serving",

    new DateTime(2020,6,2) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,4) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,9) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,11) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,16) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,18) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,23) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,25) : "Dinner On Us - Second Serving",
    new DateTime(2020,6,30) : "Dinner On Us - Second Serving",
    new DateTime(2020,7,2) : "Dinner On Us - Second Serving",
    
    new DateTime(2020,9,4)  : "Acres Homes Multi-Service Center",
    new DateTime(2020,10,9) : "Sunnyside Multi-Service Center",
    new DateTime(2020,11,23) : "Acres Homes Multi-Service Center",
    new DateTime(2020,12,21) : "Sunnyside Multi-Service Center",
    
    };

    if (eventDetailMaps.containsKey(date))
    {
      var sunnysideAddress = """9314 Cullen Blvd
Houston, TX 77051""";
      var kashmereAddress = """4802 Lockwood Dr 
Houston, TX 77026""";
      var redfordAddress = """1221 Redford Street
Houston, TX 77034""";
      var acresAddress = """6719 W Montgomery Road
Houston, TX 77091""";


    var location  = eventDetailMaps[date];
    var address = location.contains("Redford") ? redfordAddress : (location.contains("Sunny") ? sunnysideAddress : kashmereAddress);
    //address = """702 Avenida De Las Americas 
//Houston, TX""";
    var eventTime = location.contains("Redford") ? "9:30 AM - 12:30 PM" : (DateFormat('EEEE').format(date) == "Friday" ? "3:00 PM - 5:00 PM" : "11:00 AM - 1:00 PM");
    //eventTime = "10:00 AM - 12:00 PM";
    var dateDisp = DateFormat('MM/dd/yyyy').format(date);

    if (location.contains("Acres"))
    {
      address = acresAddress;
      eventTime = "11:00 AM - 01:00 PM";
    }
    //var contactNo = location.contains("Sunny") ? "(832) 395-0069" : "(832) 393-5503";


    showDialog(
        context: context,
        builder: (context) => Center(
          child: SingleChildScrollView (
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              child: Padding(padding: const EdgeInsets.all(1.0),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: "\n" + location,
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
                                text: dateDisp,
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                            TextSpan(
                              text: "\nTime: ",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: eventTime,
                                style: TextStyle(color : Colors.black, fontSize: 20)
                            ),
                            TextSpan(
                              text: "\nAddress: \n",
                              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                                text: address + "\n",
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
                    ]
                ),
              ),
            ),
          ),
          ),
        )
    );

    


  }
}
    

}
