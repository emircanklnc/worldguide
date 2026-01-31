import 'package:flutter/material.dart';

import '../Model/CountryModel.dart';

class PopularCountryView extends StatelessWidget {
late Future<List<Country>> counrty;
PopularCountryView({required this.counrty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPopularCountryBody(),
    );
  }

  Widget buildPopularCountryBody(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text("Popüler Ülkeler"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 125.0),
          child: SizedBox(
            height: 300,
            child: FutureBuilder(future: counrty, builder: (context,snapshot){
               if(snapshot.hasData){
                 var countries = snapshot.data;
                 var popularCountries = countries!.where((country){
                   return  country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan";
                 }).toList();
                 return GridView.builder(
                   itemCount: popularCountries.length,
                     scrollDirection: Axis.horizontal,
                     gridDelegate:
                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2.2), itemBuilder: (context,index){
                     var country = popularCountries[index];
                     return SizedBox(
                       child: Card(
                         clipBehavior: Clip.antiAlias,
                         child: Column(
                           children: [
                             Image.network(country.flags.png),
                           ],
                         ),
                       ),
                     );
                   });
               }
               else{
                 return Center(child: CircularProgressIndicator(),);
               }
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: SizedBox(
            height: 150,
            child: FutureBuilder(future: counrty, builder: (context,snapshot){
              if(snapshot.hasData){
                var countries = snapshot.data;
                var popularCountries = countries!.where((country){
                  return  country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan";
                }).toList();
                return GridView.builder(
                    itemCount: popularCountries.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 1.2), itemBuilder: (context,index){
                  var country = popularCountries[index];
                  return SizedBox(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Image.network(country.flags.png),
                        ],
                      ),
                    ),
                  );
                });
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            }),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 125.0),
          child: SizedBox(child: ElevatedButton(onPressed: (){}, child: Text("Bütün Ülkeleri Keşfedin"))),
        )
      ],
    );
  }
}

