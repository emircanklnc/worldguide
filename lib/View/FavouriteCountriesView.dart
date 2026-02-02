
import 'package:country_app/Model/CountryModel.dart';
import 'package:country_app/Services/CountryServices.dart';
import 'package:country_app/View/DetailCounrtyView.dart';
import 'package:country_app/ViewModel/FavouriteCountryViewModel.dart';
import 'package:flutter/material.dart';

import 'CountryView.dart';
import 'HomePageView.dart';

class FavouriteCountries extends StatefulWidget {
  const FavouriteCountries({super.key});

  @override
  State<FavouriteCountries> createState() => _FavouriteCountriesState();
}

class _FavouriteCountriesState extends State<FavouriteCountries> {
  late Future<List<Country>> cs;
  late var selectedIndex = 2;
  late FavouriteCountryViewmodel favouriteCountry;
   late List<String> favouriteCountries = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cs = CountryService.fetchCountries();
    favouriteCountry = FavouriteCountryViewmodel();
    loadFavourites();
  }
  Future<void> loadFavourites() async {
    var favs = await favouriteCountry.fetchfavouriteCountries();
    setState(() {
      favouriteCountries = favs;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFavouriteCountriesBody(),

    );
  }

Widget buildFavouriteCountriesBody(){

    return favouriteCountries.isEmpty ? Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Henüz Bir Ülke Favorilemediniz",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            child: ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CountryPage()));
            }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple
            ),
                child: Text("Ülkeleri Keşfedin",style: TextStyle(color: Colors.white),)),
          ),
        ),
      ],
    )): FutureBuilder(future: cs, builder: (context,snapshot){
      if(snapshot.hasData){
        var countries = snapshot.data;
        countries = countries!.where((country){
          return favouriteCountries.contains(country.cca2);
        }).toList();
        return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context,index){
              var country = countries?[index];
              return GestureDetector(
                onTap: ()async{
                  var result = Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                  if(result == true){
                    await loadFavourites();
                    setState(() {

                    });
                  }
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(country!.flags.png),
                    ),
                    title: Text(country.name.common),
                    subtitle: Text(country.capital.first),
                    trailing: IconButton(onPressed: (){
                      favouriteCountry.removeFavouriteCountry(country.cca2);
                      setState(() {
                
                      });
                    }, icon: Icon(Icons.favorite,color: Colors.pink,))
                  ),
                ),
              );
            });
      }
      else{
        return Center(child: CircularProgressIndicator(),);
      }
    });
}




}
