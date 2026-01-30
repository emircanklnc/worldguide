import 'package:flutter/material.dart';

import '../Model/CountryModel.dart';

class DetailCounrty extends StatelessWidget {
  late Country country;

  DetailCounrty({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:detailCountryBody(),
    );
  }

Widget detailCountryBody(){
    return Center(
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(country.flags.png),
          Text(country.name.common),
          Text(""),
        ],
        ),
      ),
    );
}


}
