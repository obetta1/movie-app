import 'package:get/get.dart';
import 'package:movi_app/repository/movie_repository.dart';

import '../model/movies.dart';

class MovieController extends GetxController{

  final MovieRepository _movieRepository = MovieRepository();
  var movies = <Movies>[].obs;
  var newMovie = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    movies.bindStream(_movieRepository.getAllMovie());
    super.onInit();
  }

  void addMovie(Movies movie){
    _movieRepository.addMovie(movie);
  }

  void deleteMovie(String movieId){
    _movieRepository.deleteMovie(movieId);
  }

}