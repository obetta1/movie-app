import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/model/movies.dart';
import '../controller/auth_controller.dart';
import '../controller/movie_controller.dart';
import '../ui_helper/ui_helper.dart';
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
          TextButton(onPressed: ()=> auth.logoutUser(), child: const Text('Logout', style: TextStyle(
            color: Colors.white
          ),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()=> addMovies(context)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: StreamBuilder(
          stream:movieController.movieSnapShot.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    if(streamSnapshot.hasData) {
      return ListView.builder(
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            var documentId = streamSnapshot.data!.docs[index].id;
            return MovieCard(
              documentId: documentId,
              movies: movieController.movies[index],
            );
          });
    }
    return Container();
          }),
    );
  }
}

