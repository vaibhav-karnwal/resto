import 'package:http/http.dart' as http;
import 'package:resto/model/productModel.dart';
import 'dart:async';
import 'dart:convert';

class Services {
  static const String url = 'https://my-restaurant-api-1.herokuapp.com/dish';

  static Future<List<DishesList>> getDishes() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<DishesList> dishList = dishesListFromJson(response.body);
        return dishList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}