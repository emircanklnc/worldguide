import 'package:flutter/material.dart';
import '../Model/CountryModel.dart';
import '../Services/CountryServices.dart';

class CountryModelProvider extends ChangeNotifier {
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  bool isLoading = false;
  bool isSearch = false;

  List<Country> get countries =>
      isSearch ? _filteredCountries : _allCountries;

  Future<void> fetchCountries() async {
    isLoading = true;
    notifyListeners();

    _allCountries = await CountryService.fetchCountries();
    _filteredCountries = _allCountries;

    isLoading = false;
    notifyListeners();
  }

  void searchCountry(String text) {
    if (text.isEmpty) {
      isSearch = false;
      _filteredCountries = _allCountries;
    } else {
      isSearch = true;
      _filteredCountries = _allCountries.where((country) {
        return country.name.common
            .toLowerCase()
            .contains(text.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }


  void clearSearch() {
    isSearch = false;
    _filteredCountries = _allCountries;
    notifyListeners();
  }
}
