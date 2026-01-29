import 'dart:convert';
import 'package:country_app/Model/CountryModel.dart';
import 'package:http/http.dart' as http;

class CountryService {

  static const String apiUrl = "https://restcountries.com/v3.1/all?fields=name,flags,cca2,capital,region,languages,population,region";

  static Future<List<Country>> fetchCountries() async{
    final response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      final List<dynamic> decode =  jsonDecode(response.body);
      return decode.map((json)=>Country.fromJson(json)).toList();
    }

    else
      {
         throw Exception("Error");
      }
  }

}