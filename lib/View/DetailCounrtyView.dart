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
      child: SizedBox(
        height: 850,
        width: 350,
        child: Card(
          color: Colors.white70,
          elevation: 10,
          child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170.0),
                  child: SizedBox(
                    height: 200,
                    width: 450,
                    child: Card(
                      color: Colors.grey,
                      child: Positioned.fill(
                      child: Image.network(country.flags.png,fit: BoxFit.cover,))),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: SizedBox(
                    width: 500,
                    child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Ülke Özellikleri",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ülke Adı: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),maxLines: 1, overflow: TextOverflow.ellipsis,
                                        softWrap: false,),
                                      Expanded(
                                        child: Text(country.name.common,maxLines: 1, overflow: TextOverflow.ellipsis,
                                          softWrap: false,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ülke Kodu : ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                      Text(country.cca2)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ülkenin Başkenti: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                      Text(country.capital.first)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ülkenin Bulunduğu Bölge: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                      Text(country.region),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ülke Kullandığı Dil : ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                      Text(country.languages.values.first)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("Ülke Popülasyonu : ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                      Text(country.population.toString()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: SizedBox(
                                      width:300,
                                      child: ElevatedButton(onPressed: (){},
                                          child: Text("Favorilere Ekle"),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.indigo,
                                            foregroundColor: Colors.white,
                                          ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ),
          ]),
          ],
          ),
        ),
      ),
    );
}


}
