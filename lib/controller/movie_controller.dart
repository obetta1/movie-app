import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:movi_app/repository/local_storage_repository.dart';
import 'package:movi_app/repository/movie_repo/movie_repository.dart';

import '../model/movies.dart';

class MovieController extends GetxController {
  final CollectionReference movieSnapShot =
      FirebaseFirestore.instance.collection('movies');
  final CollectionReference mapSnapshot =
      FirebaseFirestore.instance.collection('Locations');
  final MovieRepository _movieRepository = MovieRepository();
  final LocalStorageRepository localStorageRepository =
      LocalStorageRepository();
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  var movies = <Movies>[].obs;
  var localMovies = <Movies>[].obs;
  var newMovie = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    movies.bindStream(_movieRepository.getAllMovie());
    addMovieToLocal();
    getMoviesFromLocaCach();
    super.onInit();
  }

  ///this is used to  get the current location and add to firebase
  void getMylocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': 'ben'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> listenToLocation() async {
    final loc.LocationData currentLocation = await location.getLocation();

    _locationSubscription = location.onLocationChanged.handleError((error) {
      print(error);
      _locationSubscription?.cancel();
    }).listen((event) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
        'name': 'ben'
      }, SetOptions(merge: true));
    });

    try {} catch (e) {}
  }

  void stopLiveLocation() {
    _locationSubscription?.cancel();
  }

  void addMovieToLocal() async {
    Box box = await localStorageRepository.open();
    await box.clear();
    for (var element in movies) {
      localStorageRepository.addMovieToLocalStorage(box, element);
    }
  }

  void getMoviesFromLocaCach() async {
    Box box = await localStorageRepository.open();
    localMovies.clear();
    localMovies.addAll(localStorageRepository.getMovieFromLocalStorage(box));
  }

  void addMovie(Movies movie) {
    _movieRepository.addMovie(movie);
    addMovieToLocal();
    getMoviesFromLocaCach();
  }

  void deleteMovie(String movieId, Movies movies) async {
    Box box = await localStorageRepository.open();
    await localStorageRepository.removeMovieFromLocalStorage(box, movies);
    await _movieRepository.deleteMovie(movieId);
    getMoviesFromLocaCach();
  }
}
