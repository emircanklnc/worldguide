
import 'package:country_app/View/DetailCounrtyView.dart';
import 'package:country_app/ViewModel/CountryModelProvider.dart';
import 'package:country_app/ViewModel/FavouriteCountryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CountryView.dart';


class FavouriteCountries extends StatefulWidget {
  const FavouriteCountries({super.key});

  @override
  State<FavouriteCountries> createState() => _FavouriteCountriesState();
}

class _FavouriteCountriesState extends State<FavouriteCountries> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFavouriteCountriesBody(context),
    );
  }

  Widget buildFavouriteCountriesBody(BuildContext context) {
    return Consumer2<FavouriteCountryViewmodel, CountryModelProvider>(
      builder: (context, favVM, countryVM, child) {

        if (favVM.favouriteCounrtries.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Henüz Bir Ülke Favorilemediniz",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CountryPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    "Ülkeleri Keşfedin",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }

        final favouriteCountries = countryVM.countries
            .where((c) => favVM.isFavourite(c.cca2))
            .toList();

        return ListView.builder(
          itemCount: favouriteCountries.length,
          itemBuilder: (context, index) {
            final country = favouriteCountries[index];

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(country.flags.png),
                ),
                title: Text(country.name.common),
                subtitle: Text(country.capital.first),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.pink),
                  onPressed: () {
                    favVM.toggleFavourite(country.cca2);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailCounrty(country: country),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
