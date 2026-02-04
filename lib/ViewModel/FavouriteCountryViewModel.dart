
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteCountryViewmodel extends ChangeNotifier{
  late List<String> _favouriteCountries = [];
  List<String> get favouriteCounrtries  => _favouriteCountries;
  Future<void> toggleFavourite(String cca2) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(_favouriteCountries.contains(cca2)){
      _favouriteCountries.remove(cca2);
    }
    else
    {
      _favouriteCountries.add(cca2);
    }
    await pref.setStringList("favourite", _favouriteCountries);
    notifyListeners();
  }

  Future<void> fetchfavouriteCountries() async{
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    _favouriteCountries = prefs.getStringList("favourite") ?? [];
    notifyListeners();
  }

  Future<void> removeFavouriteCountry(String cca2) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favouriteCountries.remove(cca2);
    await prefs.setStringList("favourite", _favouriteCountries);
    notifyListeners();
  }

  bool isFavourite(String cca2){
    return _favouriteCountries.contains(cca2);
   }

}