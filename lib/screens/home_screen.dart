import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movi_app/model/movies.dart';


import '../ui_helper/ui_helper.dart';
import '../widgets/movie_poster_card.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final CollectionReference _movieDetails = FirebaseFirestore.instance.collection('movie');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()=> addMovies(context)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: StreamBuilder(
          stream: _movieDetails.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    if(streamSnapshot.hasData) {
      return ListView.builder(
          itemCount: streamSnapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var documentId = streamSnapshot.data!.docs[index].id;
            final DocumentSnapshot documentSnapshot = streamSnapshot.data!
                .docs[index];
            return MovieCard(
              documentSnapshot: documentSnapshot,
              movies: Movies.movies[index],
            );
          });
    }
    return Container();
          }),
    );
  }
}

