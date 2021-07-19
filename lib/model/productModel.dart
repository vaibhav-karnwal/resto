// To parse this JSON data, do
//
//     final dishesList = dishesListFromJson(jsonString);

import 'dart:convert';

List<DishesList> dishesListFromJson(String str) => List<DishesList>.from(json.decode(str).map((x) => DishesList.fromJson(x)));

String dishesListToJson(List<DishesList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DishesList {
  DishesList({
    this.id,
    this.title,
    this.img,
    this.description,
    this.counter,
    this.price,
  });

  int id;
  String title;
  String img;
  String description;
  String counter;
  String price;

  factory DishesList.fromJson(Map<String, dynamic> json) => DishesList(
    id: json["id"],
    title: json["title"],
    img: json["img"],
    description: json["description"],
    counter: json["counter"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "img": img,
    "description": description,
    "counter": counter,
    "price": price,
  };
}
