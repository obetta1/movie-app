import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/controller/movie_controller.dart';
import 'package:movi_app/screens/home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                controller.getMylocation();
              },
              child: const Text('add my location')),
          TextButton(
              onPressed: () {
                controller.listenToLocation();
              },
              child: const Text('enable live location')),
          TextButton(
              onPressed: () {
                controller.stopLiveLocation();
              },
              child: const Text('stop live location')),
          StreamBuilder(
              stream: controller.mapSnapshot.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              snapshot.data!.docs[index]['name'].toString()),
                          subtitle: Row(
                            children: [
                              Text(snapshot.data!.docs[index]['latitude']
                                  .toString()),
                              Text(snapshot.data!.docs[index]['longitude']
                                  .toString()),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(HomeScreen());
                              },
                              icon: Icon(Icons.directions)),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
