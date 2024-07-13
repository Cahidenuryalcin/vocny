import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vocny/models/definations.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  final String url = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  Future<WordDefinition?> fetchWord() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(res.body);
      return WordDefinition.fromJson(jsonResponse[0]);
    }
    else{
      debugPrint("istek basarisiz");
    }
    return null;
  }
}
