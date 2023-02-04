// To parse this JSON data, do
//
//     final newsArticle = newsArticleFromMap(jsonString);

import 'dart:convert';

List<NewsArticle> newsArticleFromMap(String str) =>
    List<NewsArticle>.from(json.decode(str).map((x) => NewsArticle.fromMap(x)));

String newsArticleToMap(List<NewsArticle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class NewsArticle {
  NewsArticle({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    required this.age,
  });

  Name name;
  Images images;
  String gender;
  String species;
  String? homePlanet;
  String occupation;
  List<String> sayings;
  int id;
  String age;

  factory NewsArticle.fromMap(Map<String, dynamic> json) => NewsArticle(
        name: Name.fromMap(json["name"]),
        images: Images.fromMap(json["images"]),
        gender: json["gender"],
        species: json["species"],
        homePlanet: json["homePlanet"],
        occupation: json["occupation"],
        sayings: List<String>.from(json["sayings"].map((x) => x)),
        id: json["id"],
        age: json["age"],
      );

  Map<String, dynamic> toMap() => {
        "name": name.toMap(),
        "images": images.toMap(),
        "gender": gender,
        "species": species,
        "homePlanet": homePlanet,
        "occupation": occupation,
        "sayings": List<dynamic>.from(sayings.map((x) => x)),
        "id": id,
        "age": age,
      };
}

class Images {
  Images({
    required this.headShot,
    required this.main,
  });

  String headShot;
  String main;

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        headShot: json["head-shot"],
        main: json["main"],
      );

  Map<String, dynamic> toMap() => {
        "head-shot": headShot,
        "main": main,
      };
}

class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
  });

  String first;
  String middle;
  String last;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        first: json["first"],
        middle: json["middle"],
        last: json["last"],
      );

  Map<String, dynamic> toMap() => {
        "first": first,
        "middle": middle,
        "last": last,
      };
}
