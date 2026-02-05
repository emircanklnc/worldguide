import 'package:country_app/View/ChatBotView.dart';
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
      ChatBotView(),
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
          onTap: (index) {
            nav.ChangedIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Ana Sayfa",
              backgroundColor: Colors.indigo
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Ülkeler",
              backgroundColor: Colors.indigo
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat),
              label: "ChatBot",
              backgroundColor: Colors.indigo
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoriler",
              backgroundColor: Colors.indigo
            ),
          ],
        );
      },
    );
  }


}