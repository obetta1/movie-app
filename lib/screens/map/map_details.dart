import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movi_app/controller/movie_controller.dart';

class MapDetails extends StatefulWidget {
  final String userId;
  const MapDetails({Key? key, required this.userId}) : super(key: key);

  @override
  State<MapDetails> createState() => _MapDetailsState();
}

class _MapDetailsState extends State<MapDetails> {
  final controller = Get.put(MovieController());
  late final GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: controller.mapSnapshot.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                mapType: MapType.normal,
                markers: {
                  Marker(
                    position: LatLng(
                      snapshot.data!.docs.singleWhere(
                          (element) => element.id == widget.userId)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.userId)['longitude'],
                    ),
                    markerId: MarkerId('id'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueMagenta),
                  )
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                  snapshot.data!.docs.singleWhere(
                      (element) => element.id == widget.userId)['latitude'],
                  snapshot.data!.docs.singleWhere(
                      (element) => element.id == widget.userId)['longitude'],
                )),
                onMapCreated: (GoogleMapController controller) async {
                  _mapController = controller;
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
