import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movi_app/model/movies.dart';
import 'package:movi_app/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository{
  final FirebaseFirestore _firebaseFirestore;
  final CollectionReference _movieDetails = FirebaseFirestore.instance.collection('ben');

  MovieRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;


  @override
  Stream<Movies> getMovie(String movieId) {
    return _firebaseFirestore.collection('movies')
        .doc(movieId).snapshots().map((snap) => Movies.fromSnapshot(snap));
  }

  @override
  Stream<List<Movies>> getAllMovie() {
   return _firebaseFirestore.collection('movies').snapshots().map((snap) {
     return snap.docs.map((doc) => Movies.fromSnapshot(doc)).toList();});
  }

  @override
  Future<void> addMovie(Movies movie) {
   return _firebaseFirestore.collection('movies').add(movie.toSnapshot());
  }

  @override
  Future<void> deleteMovie(String movieId) async {
    await _firebaseFirestore.collection('movies').doc(movieId).delete();
  }



}