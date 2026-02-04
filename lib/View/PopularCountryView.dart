import 'package:country_app/View/DetailCounrtyView.dart';
import 'package:country_app/ViewModel/CountryModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CountryView.dart';

class PopularCountryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPopularCountryBody(context),
    );
  }

  Widget buildPopularCountryBody(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white70,
                Colors.black26
              ])
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text("Popüler Ülkeler",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 125.0),
            child: SizedBox(
              height: 250,
              child: Consumer<CountryModelProvider>(builder: (context,vm,_){
                 if(vm.isLoading == false){
                   var countries = vm.countries;
                   var popularCountries = countries!.where((country){
                     return  country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan" || country.name.common == "Turkey" || country.name.common == "Italy";
                   }).toList();
                   return GridView.builder(
                     itemCount: popularCountries.length,
                       scrollDirection: Axis.horizontal,
                       gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2.1), itemBuilder: (context,index){
                       var country = popularCountries[index];
                       return GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                         },
                         child: SizedBox(
                           child: Card(
                             clipBehavior: Clip.antiAlias,
                             child: Container(
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                     begin: Alignment.topCenter,
                                     end: Alignment.bottomCenter,
                                     colors: [
                                       Colors.black12,
                                       Color(0xFF1E3A5F)
                                     ])
                               ),
                               child: Column(
                                 children: [
                                   Expanded(
                                     flex: 1,
                                     child: ClipRRect(
                                       borderRadius: const BorderRadius.only(
                                         bottomLeft: Radius.circular(20),
                                         bottomRight: Radius.circular(20),
                                       ),
                                       child: Image.network(
                                         country.flags.png,
                                         fit: BoxFit.cover,
                                         width: double.infinity, // 🔥 bu çok önemli
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                     flex: 1,
                                     child: Center(
                                       child: Padding(
                                         padding: const EdgeInsets.only(top: 25.0),
                                         child: Column(
                                           children: [
                                             Text(country.name.common,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                                             Text(country.capital.first,style: TextStyle(color: Colors.white,fontSize: 15),),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
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
            padding: const EdgeInsets.only(top:150.0),
            child: SizedBox(
              height: 75,
              child: Consumer<CountryModelProvider>(builder: (context,vm,_){
                if(vm.isLoading == false){
                  var countries = vm.countries;
                  var popularCountries = countries!.where((country){
                    return  country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan" || country.name.common == "Italy" || country.name.common == "Turkey" || country.name.common == "United Kingdom" || country.name.common == "Greece" || country.name.common == "Thailand" ;
                  }).toList();
                  return GridView.builder(
                      itemCount: popularCountries.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 1.2), itemBuilder: (context,index){
                    var country = popularCountries[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                      },
                      child: SizedBox(
                        height: 75,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                          children: [
                            Positioned.fill(child: Image.network(country.flags.png,fit: BoxFit.cover,))
                          ],
                          ),
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
            child: SizedBox(
              width: 375,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E3A5F),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    }, child: Row(
                  children: [
                    Icon(Icons.airplane_ticket,color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(left: 75.0),
                      child: Text("Bütün Ülkeleri Keşfedin",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ))),
          )
        ],
      ),
    );
  }
}

