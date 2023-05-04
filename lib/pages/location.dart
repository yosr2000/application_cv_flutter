import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../menu/drawer.widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();
  Position? _currentPosition;
  late BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();

    // Initialiser l'icône du marqueur
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)),'images/marker1.png')
        .then((icon) {
      setState(() {
        _markerIcon = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),

      appBar: AppBar(
        title: Text('Google maps'),
        backgroundColor: Color(0xFF1BBDB8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context,"/home");// retour à la page précédente
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(34.747847, 10.766163),
              zoom: 14,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _currentPosition?.latitude != null && _currentPosition?.longitude != null
                ? <Marker>[
              Marker(
                markerId: MarkerId('current'),
                position: LatLng(
                    _currentPosition!.latitude, _currentPosition!.longitude),
                icon: _markerIcon,
              ),
            ].toSet()
                : Set<Marker>(),

          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton.extended(
              backgroundColor: Color(0xFF1BBDB8),
              onPressed: () {
                _getCurrentLocation();
              },label: const Text("Current Location"),
              icon: const Icon(Icons.location_history),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 14,
        ),
      ),
    );
  }
}
