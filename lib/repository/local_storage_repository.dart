import 'package:hive/hive.dart';
import 'package:movi_app/model/movies.dart';
import 'package:movi_app/repository/base_local_repository.dart';

class LocalStorageRepository extends BaseLocalStorageRepository{
  final String boxName = 'movie_box';
  @override
  Future<Box> open() async{
    Box box = await Hive.openBox<Movies>(boxName);
    return box;
  }

  @override
  Future<void> addMovieToLocalStorage(Box box, Movies movies) async{
    await box.put(movies.id, movies);
  }

  @override
  Stream<List<Movies>> getMovieFromLocalStorage(Box box) {
    return box.values.toList() as Stream<List<Movies>>;
  }

  @override
  Future<void> removeMovieFromLocalStorage(Box box, Movies movies) async{
    await box.delete(movies.id);
  }

  @override
  Future<void> clearStorage(Box box) async{
    await box.clear();
  }
}