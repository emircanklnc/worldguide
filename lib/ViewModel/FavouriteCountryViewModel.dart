
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteCountryViewmodel {
  late List<String> favouriteCountry = [];

  Future<void> favouriteCountriesAddButton(String cca2) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(favouriteCountry.contains(cca2)){
      favouriteCountry.remove(cca2);
    }
    else
    {
      favouriteCountry.add(cca2);
    }
    await pref.setStringList("favourite", favouriteCountry);
  }

  Future<List<String>> fetchfavouriteCountries() async{
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    List<String>? favourite = prefs.getStringList("favourite");

    if(favourite != null){
      for(var cca2 in favourite){
        favouriteCountry.add(cca2);
      }
    }
    return favouriteCountry;
  }

  Future<void> removeFavouriteCountry(String cca2) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    favouriteCountry.remove(cca2);
    await prefs.setStringList("favourite", favouriteCountry);
  }
}