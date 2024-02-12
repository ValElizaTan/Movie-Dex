import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  final double cinemaLatitude;
  final double cinemaLongitude;

  MapPage({
    Key key,
    @required this.cinemaLatitude,
    @required this.cinemaLongitude,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor _locIcon;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  Future<BitmapDescriptor> _setLocCustomMarker() async {
    BitmapDescriptor bIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'images/home-map-pin.png');
    return bIcon;
  }

  @override
  void initState() {
    super.initState();
    _setLocCustomMarker().then((value) {
      _locIcon = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.cinemaLatitude, widget.cinemaLongitude),
          zoom: 14.0,
        ),
        markers: _markers,
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _addPolyline();
        },
      ),
    );
  }

  void _addPolyline() async {
    LocationData currentLocation = await _getLocation();

    if (currentLocation != null) {
      List<LatLng> points = [
        LatLng(currentLocation.latitude, currentLocation.longitude),
        LatLng(widget.cinemaLatitude, widget.cinemaLongitude),
      ];

      _polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          color: Colors.red,
          points: points,
          width: 8,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        ),
      );

      _markers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          icon: _locIcon,
          infoWindow: InfoWindow(title: 'Current Location'),
        ),
      );

      _markers.add(
        Marker(
          markerId: MarkerId('destination_location'),
          position: LatLng(widget.cinemaLatitude, widget.cinemaLongitude),
          infoWindow: InfoWindow(title: 'Destination Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        ),
      );

      setState(() {});
    }
  }

  Future<LocationData> _getLocation() async {
    Location location = Location();
    return await location.getLocation();
  }
}
