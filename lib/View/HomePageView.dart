
import 'package:country_app/View/DetailCounrtyView.dart';
import 'package:country_app/View/PopularCountryView.dart';
import 'package:country_app/View/RegionView.dart';
import 'package:country_app/ViewModel/CountryModelProvider.dart';
import 'package:country_app/ViewModel/RegionViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/RegionModel.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
 bool isSearch = false;
var tfCR = TextEditingController();
var searchCr = TextEditingController();
late Future<List<Region>> region;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    region = RegionViewModel().getRegion();
 }
 @override
 @override
 void dispose() {
   tfCR.dispose();
   searchCr.dispose();
   super.dispose();
 }


 @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: buildHomePageBody(),
    );
  }

  Widget buildHomePageBody(){

      return isSearch ? Column(
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
                  controller: searchCr,
                  onChanged:(callResponse){
                    context.read<CountryModelProvider>().searchCountry(callResponse);
                  },
                  decoration: InputDecoration(
                      hint: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Icon(Icons.search),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text("Ülke veya Bölge Ara"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 125.0,top: 10),
                            child: IconButton(onPressed: (){
                              context.read<CountryModelProvider>().clearSearch();
                              setState(() {
                                isSearch = false;
                              });
                              }, icon: Icon(Icons.cancel)),
                          ),
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
          SizedBox(
            height: 735,
            child: Consumer<CountryModelProvider>(builder: (context,vm,child){
              if(vm.isLoading == false){
                var  countries = vm.countries;
                return GridView.builder(
                    itemCount: countries!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.6),
                    itemBuilder: (context,index){
                     var country = countries![index];
                     return GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                       },
                       child: SizedBox(
                         height: 200,
                         child: Card(
                           child: Stack(
                             children: [
                                   Positioned.fill(
                                       child: Image.network(country.flags.png,fit: BoxFit.cover,)),
                                  Positioned.fill(child: Container(
                                    decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.8),
                                        ]),
                                    ),
                                  )),
                                   Positioned(
                                       top: 95,
                                       left: 2,
                                       child: Text(country.name.common,style: TextStyle(color: Colors.white),)
                                   ),

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
        ],
      )
          : Column(
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
                  onTap:(){
                    setState(() {
                      isSearch =true;
                    });
                  },
                  onChanged:(callResponse){
                      setState(() {
                        tfCR.text = callResponse;
                      });
                  },
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
            child: Consumer<CountryModelProvider>(
              builder: (context,vm,child) {
                if (vm.isLoading == false) {
                  final countries = vm.countries;

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
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                        },
                        child: SizedBox(
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
                                          Colors.black.withOpacity(0.8),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 2,
                                    top: 170,
                                    child: Text("${country.name.common}",style: TextStyle(fontSize: 13,color: Colors.white),))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                 else {
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
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegionView(region: region,)));
                  },
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
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PopularCountryView()));
                  },
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
            child: Consumer<CountryModelProvider>( builder: (context,vm,child){
              if(vm.isLoading == false){
                var countries = vm.countries;
                var populerCountries = countries.where((country){
                  return country.name.common == "Turkey" || country.name.common == "France" || country.name.common == "Germany" || country.name.common == "Japan";
                }).toList();
                return GridView.builder(
                          itemCount: populerCountries.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 10,),
                          itemBuilder: (context,index){
                             var country = populerCountries[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCounrty(country: country)));
                            },
                            child: SizedBox(
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
                                    Positioned.fill(child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.8)
                                            ])
                                      ),
                                    )),
                                    Positioned(
                                      left: 8,
                                      bottom: 8,
                                      child: Text(
                                        country.name.common,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
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

}



