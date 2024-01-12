import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final LocationData userLocation;
  const MapPage({Key key, this.userLocation}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  //Custom Marker Icon
  BitmapDescriptor _locIcon;
  final Set<Marker> listMarkers = {};

  //Create Custom Marker
  Future<BitmapDescriptor> _setLocCustomMarker() async {
    BitmapDescriptor bIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'images/home-map-pin.png');

    return bIcon;
  }

  @override

  //Set initState
  void initState() {
    super.initState();

    _setLocCustomMarker().then((value) {
      _locIcon = value;
      _locIcon != null
          ? setState(() {
              listMarkers.add(Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(widget.userLocation.latitude,
                      widget.userLocation.longitude),
                  infoWindow: InfoWindow(title: 'Current Location'),
                  icon: _locIcon));
            })
          : DoNothingAction();
    });
  }

  Widget build(BuildContext context) {
    CameraPosition _currentPos = CameraPosition(
        bearing: 0.0,
        target:
            LatLng(widget.userLocation.latitude, widget.userLocation.longitude),
        tilt: 0,
        zoom: 17);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        //Set Marker
        markers: Set.from(listMarkers),
        myLocationEnabled: true,
        initialCameraPosition: _currentPos,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
