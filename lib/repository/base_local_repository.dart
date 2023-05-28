import 'package:hive/hive.dart';
import 'package:movi_app/model/movies.dart';

abstract class BaseLocalStorageRepository{
  Future<Box> open();
  List<Movies> getMovieFromLocalStorage(Box box);
  Future<void> addMovieToLocalStorage(Box box, Movies movies);
  Future<void> removeMovieFromLocalStorage(Box box, Movies movies);
  Future<void> clearStorage(Box box);
}