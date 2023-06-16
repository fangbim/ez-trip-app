import 'package:flutter/foundation.dart';

class Wisata {
  final String id;
  final String imageURL;
  final String category;
  final String title;
  final String location;
  final String desc;

  Wisata(
      {required this.id,
      required this.imageURL,
      required this.category,
      required this.title,
      required this.location,
      required this.desc});

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
        id: json['_id'],
        imageURL: json['imageURL'],
        category: json['category'],
        title: json['title'],
        location: json['location'],
        desc: json['desc']);
  }
}
