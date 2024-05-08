import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../globals.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import '../main.dart';
import 'package:map_launcher/map_launcher.dart';


Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
  final Uint8List imageData = await getBytesFromAsset(path, width);
  return BitmapDescriptor.fromBytes(imageData);
}

class LocationScreen extends StatefulWidget {

  @override
  State<LocationScreen> createState() => _MyLocationState();
}

class _MyLocationState extends State<LocationScreen> {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};

  openMapsSheet(context) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;
    } catch (e) {
      print(e);
    }
  }

    void _onMapCreated(GoogleMapController controller) async {
    final availableMaps = await MapLauncher.installedMaps;

    mapController = controller;
    final hotelIcon = await getBitmapDescriptorFromAssetBytes("images/MapIcons/hotel.png", 132);
    final GASIcon = await getBitmapDescriptorFromAssetBytes("images/MapIcons/GAS.png", 132);
    final metroIcon = await getBitmapDescriptorFromAssetBytes("images/MapIcons/metro.png", 132);
    final partyIcon = await getBitmapDescriptorFromAssetBytes("images/MapIcons/party.png", 132);

    setState(() {
      _markers.clear();
      for (final loc in PartyLocations) {
        final marker = Marker(
          markerId: MarkerId(loc["title"]),
          position: loc["latlng"],
          infoWindow: InfoWindow(
            title: loc["title"],
            snippet: loc["description"],
            onTap: () async {
              print("tap!");
              await availableMaps.first.showMarker(
                coords: loc["coords"],
                title: loc["title"],
              );
            }
          ),
          icon: partyIcon,
        );
        _markers[loc["title"]] = marker;
      }
      for (final loc in MetroLocations) {
        final marker = Marker(
          markerId: MarkerId(loc["title"]),
          position: loc["latlng"],
          infoWindow: InfoWindow(
            title: loc["title"],
            snippet: loc["description"],
              onTap: () async {
                print("tap!");
                await availableMaps.first.showMarker(
                  coords: loc["coords"],
                  title: loc["title"],
                );
              }
          ),
            icon: metroIcon,
        );
        _markers[loc["title"]] = marker;
      }
      for (final loc in HotelLocations) {
        final marker = Marker(
          markerId: MarkerId(loc["title"]),
          position: loc["latlng"],
          infoWindow: InfoWindow(
            title: loc["title"],
            snippet: loc["description"],
              onTap: () async {
                print("tap!");
                await availableMaps.first.showMarker(
                  coords: loc["coords"],
                  title: loc["title"],
                );
              }
          ),
          icon: hotelIcon,
        );
        _markers[loc["title"]] = marker;
      }
      for (final loc in GASLocations) {
        final marker = Marker(
          markerId: MarkerId(loc["title"]),
          position: loc["latlng"],
          infoWindow: InfoWindow(
            title: loc["title"],
            snippet: loc["description"],
              onTap: () async {
                print("tap!");
                await availableMaps.first.showMarker(
                  coords: loc["coords"],
                  title: loc["title"],
                );
              }
          ),
          icon: GASIcon,
        );
        _markers[loc["title"]] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text('LOCATIONS', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
          elevation: 2,
          backgroundColor: primaryColor),

      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: zoom,
          ),
          markers: _markers.values.toSet()
      ),
    );
  }
}