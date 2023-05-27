import '../../model/movies.dart';

abstract class BaseMovieRepository{
  Stream<Movies> getMovie(String movieId);
  Stream<List<Movies>> getAllMovie();
  Future<void> addMovie(Movies movie);
  Future<void> deleteMovie(String movieId);
}