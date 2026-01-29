import 'package:flutter/material.dart';

import '../Model/CountryModel.dart';
import '../Services/CountryServices.dart';
import 'HomePageView.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  late Future<List<Country>> cs;
  late int selectedIndex = 1;
  var isSearch = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cs = CountryService.fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCountryAppbar(),
      body: buildCountryBody(),
      bottomNavigationBar: buildNavBar(),

    );
  }

  AppBar buildCountryAppbar() {
    return AppBar(
           leading:
          Row(
        children: [
          Text("Ülkeler",style: TextStyle(fontSize: 17, fontWeight : FontWeight.w700),)
        ],  
        ),
      actions: [
           IconButton(onPressed: (){
          setState(() {
            isSearch = 1;
          });
        }, icon: Icon(Icons.search))
      ],
      backgroundColor: Colors.white,
    );
  }


  Widget buildCountryBody() {
    return FutureBuilder<List<Country>>(
        future: cs, builder: (context, snapshot) {
      if (snapshot.hasData) {
        var countries = snapshot.data;

        return ListView.builder(
            itemCount: countries!.length,
            itemBuilder: (context,index){
          var country = countries[index];
          countries.sort(
                (a, b) => a.name.common.compareTo(b.name.common),
          );

          final firstLetter = country.name.common[0].toUpperCase();
          final bool showHeader = index == 0 || countries[index - 1].name.common[0].toUpperCase() != firstLetter;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(showHeader)
                Text(firstLetter),
              SizedBox(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(country.flags.png),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(country.name.common),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      }
      else {
        return Center(child: CircularProgressIndicator(),);
      }
    });
  }

  Widget buildNavBar() {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            if (selectedIndex == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (selectedIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CountryPage()));
            }
          });
        },
        items: [BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Ana Sayfa",
        ),
          BottomNavigationBarItem(icon: Icon(Icons.list),
            label: "Ülkeler",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),
              label: "Favoriler"),
        ]
    );
  }
}
