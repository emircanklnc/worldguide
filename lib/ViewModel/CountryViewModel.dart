import '../Model/CountryModel.dart';

class CountryViewModel {

  List<Country> regionCountryFilter(List<Country> countries,bool isSearch,String word) {
    List<Country> countriesList = List.from(countries);
    countriesList.sort((a,b)=>a.name.common.compareTo(b.name.common));
    if(isSearch && word.isNotEmpty) {
      countriesList = countriesList.where((country) {
        return country.name.common.toLowerCase().contains(word.toLowerCase());
      }).toList();
    }
    return countriesList;
  }

  bool showHeader (List<Country> countries ,int index){
    if(index == 0){
      return true;
    }
    else{
      final currentLetter = countries[index].name.common[0].toUpperCase();
      final previousLetter = countries[index - 1].name.common[0].toUpperCase();
      return currentLetter != previousLetter;
    }

  }


  String getHeader(Country country) {
    return country.name.common[0];
  }


}