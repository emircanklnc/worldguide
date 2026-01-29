
import 'dart:developer';

import 'package:country_app/Model/CountryModel.dart';
import 'package:country_app/Services/CountryServices.dart';
import 'package:country_app/View/CountryView.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
 int selectedIndex = 0;
late Future<List<Country>> cs;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cs = CountryService.fetchCountries();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildHomePageBody(),
      bottomNavigationBar: buildNavBar(),

    );
  }



  Widget buildHomePageBody(){

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: 45,
              width: 375,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Row(
                      children: [
                        Icon(Icons.search),
                        Text("Ülke veya Bölge Ara"),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    )
                  ),

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              "Dünyayı Keşfet",
              style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.w700),
            ),
          ),


          SizedBox(
            height: 200,
            child: FutureBuilder<List<Country>>(
              future: cs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final countries = snapshot.data!;

                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: countries.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      final country = countries[index];
                      return SizedBox(
                        child: Card(
                          elevation: 8,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: Image.network(country.flags.png,fit: BoxFit.cover,)),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 2,
                                  top: 170,
                                  child: Text("${country.name.common}",style: TextStyle(fontSize: 13,color: Colors.black),))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text("API Error"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text("Kıtalar",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                height: 75,
                  width: 75,
                  child: Column(
                  children: [
                    Icon(Icons.circle),
                    Text("Kıtalar")
                  ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      Icon(Icons.local_fire_department),
                      Text("En Popüler")
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      Icon(Icons.arrow_circle_right),
                      Text("Yakınındaki")
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
             Text("En Popüler",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
          SizedBox(
            height: 200,
            child: FutureBuilder<List<Country>>(future: cs, builder: (context,snapshot){
              if(snapshot.hasData){
                var countries = snapshot.data;
                var populerCountries = countries!.where((country){
                  return country.name.common == "Turkey" || country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan";
                }).toList();
                return GridView.builder(
                          itemCount: populerCountries.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 10,),
                          itemBuilder: (context,indeks){
                             var country = populerCountries[indeks];
                          return SizedBox(
                            child: Card(
                              elevation: 20,
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      country.flags.png,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: 8,
                                    bottom: 8,
                                    child: Text(
                                      country.name.common,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          );
                          });
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            }),
          ),

        ],

      );

  }

  Widget buildNavBar(){
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
            if(selectedIndex == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            }
            if(selectedIndex == 1){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
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



