import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/GeminiResponseModel.dart';

class GeminiService {

  static const String _apiKey = "";

  static const String _url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_apiKey";

  Future<GeminiResponse> sendMessage(String message) async{
  final response = await http.post(Uri.parse(_url),headers: {"Content-Type": "application/json"},
      body: jsonEncode({

        "contents": [
          {
              "parts": [
                {"text": message}
              ]
        }
  ]}
  ));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return GeminiResponse.fromJson(data);

  } else {
    throw Exception("Gemini API error");
  }
  }



}