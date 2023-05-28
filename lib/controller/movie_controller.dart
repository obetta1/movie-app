import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movi_app/repository/local_storage_repository.dart';
import 'package:movi_app/repository/movie_repo/movie_repository.dart';

import '../model/movies.dart';

class MovieController extends GetxController{
  final CollectionReference movieSnapShot = FirebaseFirestore.instance.collection('movies');
  final MovieRepository _movieRepository = MovieRepository();
  final LocalStorageRepository localStorageRepository = LocalStorageRepository();
  var movies = <Movies>[].obs;
  var localMovies = <Movies>[].obs;
  var newMovie = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() async{
   movies.bindStream( _movieRepository.getAllMovie());
   addMovieToLocal();
   getMoviesFromLocaCach();
    super.onInit();
  }

  void addMovieToLocal()async{
    Box box = await localStorageRepository.open();
      movies.forEach((element) {localStorageRepository.addMovieToLocalStorage(box, element); });
  }
  void getMoviesFromLocaCach() async{
    Box box = await localStorageRepository.open();
    localMovies.clear();
    localMovies.addAll( localStorageRepository.getMovieFromLocalStorage(box));
  }

  void addMovie(Movies movie){
    _movieRepository.addMovie(movie);
    addMovieToLocal();
    getMoviesFromLocaCach();
  }

  void deleteMovie(String movieId, Movies movies) async{
    Box box = await localStorageRepository.open();
    await localStorageRepository.removeMovieFromLocalStorage(box, movies);
    await _movieRepository.deleteMovie(movieId);
    getMoviesFromLocaCach();
  }
}