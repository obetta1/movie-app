import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


import 'package:movi_app/repository/local_storage_repository.dart';
import 'package:movi_app/repository/movie_repo/movie_repository.dart';

import '../model/movies.dart';

class MovieController extends GetxController{
  final CollectionReference movieSnapShot = FirebaseFirestore.instance.collection('movies');
  final MovieRepository _movieRepository = MovieRepository();
  final LocalStorageRepository localStorageRepository = LocalStorageRepository();
  var movies = <Movies>[].obs;
  var newMovie = {}.obs;
  var isLoading = false.obs;


  @override
  void onInit() async{
   movies.bindStream( _movieRepository.getAllMovie());
    super.onInit();
  }

  void addMovieToLocal(Movies movies)async{


  }

  void addMovie(Movies movie){
    _movieRepository.addMovie(movie);
  }

  void deleteMovie(String movieId){
    _movieRepository.deleteMovie(movieId);
  }

}