import 'package:country_app/Model/CountryModel.dart';

class RegionCountryViewModel {

 List<Country> regionCountryFilter(List<Country> countries,bool isSearch,String word,String region) {
   List<Country> countriesList = List.from(countries);
   countriesList.sort((a,b)=>a.name.common.compareTo(b.name.common));
   if(isSearch && word.isNotEmpty) {
     countriesList = countriesList.where((country) {
       return country.name.common.toLowerCase().contains(word.toLowerCase());
     }).toList();
   }

   countriesList = countriesList.where((country){
     return country.region.toLowerCase().contains(region.toLowerCase());
   }).toList();

   return countriesList;
 }

 bool shouldShowHeader(List<Country> list, int index) {
   if (index == 0) return true;

   final currentLetter =
   list[index].name.common[0].toUpperCase();
   final previousLetter =
   list[index - 1].name.common[0].toUpperCase();

   return currentLetter != previousLetter;
 }

 String getHeader(Country country) {
   return country.name.common[0].toUpperCase();

 }

}