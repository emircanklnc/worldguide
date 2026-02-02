import 'package:country_app/View/DetailCounrtyView.dart';
import 'package:flutter/material.dart';

import '../Model/CountryModel.dart';
import '../Services/CountryServices.dart';
import 'FavouriteCountriesView.dart';
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
  bool isSearch = false;
  var tfCountry = TextEditingController();
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

    );
  }

  AppBar buildCountryAppbar() {
    return AppBar(
          title:  Row(
        children: [
         isSearch ? SizedBox(
           height: 50,
           width: 275,
           child: TextField(
             controller: tfCountry,
             onChanged: (callResponse){
               setState(() {
                 tfCountry.text = callResponse;
               });
             },
             decoration: InputDecoration(
               hintText: "Ülke Ara",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20),
                 borderSide: BorderSide(),
               )
             ),
           ),
         )
             : Text("Ülkeler",style: TextStyle(fontSize: 17, fontWeight : FontWeight.w700),)
        ],
        ),
      actions: [
          isSearch ? IconButton(onPressed: (){
            setState(() {
              isSearch = false;
            });
          }, icon: Icon(Icons.cancel)) : IconButton(onPressed: (){
          setState(() {
            isSearch = true;
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
         countries!.sort((a,b)=>a.name.common.compareTo(b.name.common));
         if(isSearch){
            countries = countries.where((country){
             return country.name.common.toLowerCase().contains(tfCountry.text.toLowerCase());
           }).toList();
         }
         return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context,index){
          var country = countries![index];
          final firstLetter = country.name.common[0].toUpperCase();
          final bool showHeader = index == 0 || countries[index - 1].name.common[0].toUpperCase() != firstLetter;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(showHeader)
                Text(firstLetter,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              SizedBox(
                height: 50,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 15,
                    child: SizedBox(
                      width: 425,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width:50,
                          child: Image.network(country.flags.png)),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(country.name.common,maxLines: 1,overflow: TextOverflow.ellipsis,
                              softWrap: false,),
                          ),
                        ],
                      ),
                    ),
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

}


