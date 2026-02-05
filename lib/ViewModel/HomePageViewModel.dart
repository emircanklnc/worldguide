import 'package:country_app/Model/CountryModel.dart';

class HomePageViewModel {
  List<Country> popularCounrtyFilter(List<Country> country)  {
    List<Country> popularCountry = country;
    popularCountry = popularCountry.where((country){
      return country.name.common == "Turkey" || country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan";
    }).toList();
       return popularCountry;
  }
}