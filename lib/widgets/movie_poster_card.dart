import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/controller/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/movies.dart';
import 'widget.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    this.movies,
    required this.documentId,
  }) : super(key: key);
  final Movies? movies;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (movies == null) {
          Navigator.pushNamed(context, '/catalog', arguments: movies);
        }
      },
      /**this container is used to display the poster image of the movie*/
      child: Container(
        height: 400,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Image(
                  image: CachedNetworkImageProvider(
                    movies!.imageUrl,
                  ),
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
                // Image.network(movies!.imageUrl,
                //     fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(50, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.headLine(movies!.name),
                              IconButton(
                                  tooltip: 'delete movie',
                                  onPressed: () => _deleteMovie(
                                      context, movies!, documentId),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                    size: 40,
                                  )),
                            ]),
                        CustomText.whiteText('Directed by: ${movies!.director}')
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void _deleteMovie(BuildContext context, Movies movies, String documentId) {
    final MovieController movieController = Get.find();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'About to delete item',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text('are you sure you want to delete '),
              Text(
                '${movies.name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    movieController.deleteMovie(documentId, movies);
                    Navigator.pop(
                      context,
                      'OK',
                    );
                  },
                  child: const Text('OK',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ))),
            ],
          );
        });
  }
}
