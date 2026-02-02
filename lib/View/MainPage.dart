import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/BottomNavProvider.dart';
import 'CountryView.dart';
import 'FavouriteCountriesView.dart';
import 'HomePageView.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<BottomNavProvider>();
    final pages = [
      HomePage(),
      CountryPage(),
      FavouriteCountries(),
    ];

    return Scaffold(
      body: pages[nav.currentIndex],
      bottomNavigationBar: buildNavBar(context),
    );
  }

  Widget buildNavBar(BuildContext context) {

    return Consumer<BottomNavProvider>(
      builder: (context,nav,_){
        return BottomNavigationBar(
          currentIndex: nav.currentIndex,
          backgroundColor: Colors.white,
          onTap: (index) {
            nav.ChangedIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Ana Sayfa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Ülkeler",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoriler",
            ),
          ],
        );
      },
    );
  }


}