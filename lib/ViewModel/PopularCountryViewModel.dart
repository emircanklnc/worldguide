import 'package:country_app/Model/CountryModel.dart';

class PopularCountryViewModel {

  List<Country> popularFilter1 (List<Country> countries) {
    List<Country> popularCountries = List.from(countries);
    popularCountries = popularCountries.where((country) {
      return country.name.common == "France" ||
          country.name.common == "Germany" || country.name.common == "Japan" ||
          country.name.common == "Turkey" || country.name.common == "Italy";
    }).toList();
  return popularCountries;
  }
  List<Country> popularFilter2 (List<Country> countries) {
    List<Country> popularCountries = List.from(countries);
    popularCountries = popularCountries.where((country) {
      return country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan" || country.name.common == "Italy" || country.name.common == "Turkey" || country.name.common == "United Kingdom" || country.name.common == "Greece" || country.name.common == "Thailand" ;
    }).toList();
    return popularCountries;
  }
}