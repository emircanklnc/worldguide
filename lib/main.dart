import 'package:country_app/Model/BottomNavProvider.dart';
import 'package:country_app/View/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/HomePageView.dart';
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

