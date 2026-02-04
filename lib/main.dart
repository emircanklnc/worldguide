import 'package:country_app/Model/BottomNavProvider.dart';
import 'package:country_app/View/MainPage.dart';
import 'package:country_app/ViewModel/CountryModelProvider.dart';
import 'package:country_app/ViewModel/FavouriteCountryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>BottomNavProvider()),
        ChangeNotifierProvider(create: (_)=>CountryModelProvider()..fetchCountries()),
        ChangeNotifierProvider(create: (_)=>FavouriteCountryViewmodel()..favouriteCounrtries),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MainPage(),
      ),
    );
  }
}

