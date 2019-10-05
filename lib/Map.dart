import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Map extends StatefulWidget {
  Map({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MapState createState() => _MapState();
}


class _MapState extends State<Map>{
  GoogleMapController _controller;
  double zoom = 11.0;
  static const LatLng _center = const LatLng(29.656388, -95.3585341);
  final Set<Marker> _markers = new Set();
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  void _onMapTypeButtonPressed(){
    setState((){
      if(_currentMapType == MapType.normal) {
        _currentMapType = MapType.satellite;
      }
      else {
        _currentMapType = MapType.normal;
      }
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    _controller=controller;
    _onAddMarkerButtonPressed();
  }
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("Sunnyside Multi-Service Center"),
        position: const LatLng(29.656388, -95.3585341),
        infoWindow: InfoWindow(
          title:"Sunnyside Multi-Service Center",
          snippet: "9314 Cullen 77051",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId("Kashmere Multi-Service Center"),
        position: const LatLng(29.8042647,-95.31655),
        infoWindow: InfoWindow(
          title:"Kashmere Multi-Service Center",
          snippet: "4802 Lockwood Dr 77026",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
  void _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }
  void _zoomIn(){
    _controller.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }
  void _zoomOut(){
    _controller.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: zoom,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _zoomIn,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: new Icon(FontAwesomeIcons.searchPlus, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _zoomOut,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: new Icon(FontAwesomeIcons.searchMinus, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}