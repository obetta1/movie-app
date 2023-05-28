// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'movies.g.dart';

@HiveType(typeId: 1)
class Movies extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String director;
  @HiveField(3)
  final String imageUrl;
  const Movies({
    required this.id,
    required this.name,
    required this.director,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [name, director, imageUrl];

  Movies copyWith({
    String? id,
    String? name,
    String? director,
    String? imageUrl,
  }) {
    return Movies(
      id: id ?? this.id,
      name: name ?? this.name,
      director: director ?? this.director,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toSnapshot() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'director': director,
      'imageUrl': imageUrl,
    };
  }

  factory Movies.fromSnapshot(DocumentSnapshot map) {
    return Movies(
      id: map['id'] as String,
      name: map['name'] as String,
      director: map['director'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toSnapshot());

  factory Movies.fromJson(String source) =>
      Movies.fromSnapshot(json.decode(source) as DocumentSnapshot);

  @override
  bool get stringify => true;

  static const List<Movies> movies = [
    Movies(
        id: ' 1',
        name: 'Lion King',
        director: 'Ben farret',
        imageUrl:
            'https://images.unsplash.com/photo-1616530940355-351fabd9524b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW92aWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60'),
    Movies(
        id: ' 2',
        name: 'Former child.',
        director: 'Robat later',
        imageUrl:
            'https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bW92aWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60'),
    Movies(
        id: ' 3',
        name: 'Regan-Asante',
        director: 'Samuel Regan-Asante',
        imageUrl:
            'https://images.unsplash.com/photo-1601925662822-510b76665bd9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=800&q=60'),
    Movies(
        id: ' 2',
        name: 'Ollasca hoot',
        director: 'Chihuahua',
        imageUrl:
            'https://images.unsplash.com/photo-1635805737707-575885ab0820?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=800&q=60'),
  ];
}
