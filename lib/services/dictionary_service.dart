import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vocny/models/definations.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  final String baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  Future<WordDefinition?> fetchWord(String word) async {
    var res = await http.get(Uri.parse('$baseUrl$word')); // Makes a GET request to the API
    if (res.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(res.body);
      return WordDefinition.fromJson(jsonResponse[0]); // Converts the JSON data to WordDefinition object
    } else {
      debugPrint("request failed: ${res.statusCode}");
    }
    return null;
  }
}
