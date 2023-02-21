import 'dart:convert';

import '../models/model.dart';
import 'package:http/http.dart' as http;

Future<Model> fetchData() async {
  final response = await http
      .get(Uri.parse('https://saurav.tech/NewsAPI/top-headlines/category/health/in.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Model.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}