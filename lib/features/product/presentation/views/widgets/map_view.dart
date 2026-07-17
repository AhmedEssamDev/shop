import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  Future<void> _selectLocation(LatLng position) async {
  setState(() {
    _pickedLocation = position;
  }); 

  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude, 
      position.longitude
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      // التعامل مع القيم التي قد تكون null
      String street = place.street != null && place.street!.isNotEmpty ? "${place.street}, " : "";
      String locality = place.locality != null && place.locality!.isNotEmpty ? "${place.locality}, " : "";
      String country = place.country ?? "Unknown";
      
      String address = "$street$locality$country";

      if (mounted) {
        context.pop({
          'address': address,
          'lat': position.latitude,
          'lng': position.longitude,
        });
      }
    }
  } catch (e) {
    // هنا يتم معالجة الخطأ بدلاً من توقف التطبيق
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("لم نجد عنواناً في هذه المنطقة، حاول اختيار مكان آخر")),
      );
    }
    debugPrint("Geocoding error: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختر الموقع")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(30.60, 32.26), zoom: 14), // موقع افتراضي
        onTap: _selectLocation, // عند الضغط على أي مكان في الخريطة
        markers: _pickedLocation == null ? {} : {Marker(markerId: MarkerId('m1'), position: _pickedLocation!)},
      ),
    );
  }
}