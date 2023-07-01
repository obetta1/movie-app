import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/screens/screens.dart';
import 'package:movi_app/widgets/custom_text.dart';

import '../controller/auth_controller.dart';
import '../controller/movie_controller.dart';
import '../utils/ui_helper.dart';
import '../widgets/movie_poster_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final MovieController movieController = Get.put(MovieController());
  final AuthController auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(const MapScreen());
              },
              child: Text('Map'))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              title: CustomText.blackBodyText('Logout'),
              onTap: () {
                showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add a movie',
          child: const Icon(Icons.add),
          onPressed: () => addMovies(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: StreamBuilder(
          stream: movieController.movieSnapShot.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              movieController.addMovieToLocal();
              movieController.getMoviesFromLocaCach();
              return Obx(
                () => ListView.builder(
                    itemCount: movieController.localMovies.length,
                    itemBuilder: (context, index) {
                      var documentId = streamSnapshot.data!.docs[index].id;
                      return MovieCard(
                        documentId: documentId,
                        movies: movieController.localMovies[index],
                      );
                    }),
              );
            }
            return Container();
          }),
    );
  }
}
