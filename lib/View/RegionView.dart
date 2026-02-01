import 'package:country_app/View/CountryView.dart';
import 'package:country_app/View/RegionCountryView.dart';
import 'package:country_app/ViewModel/RegionViewModel.dart';
import 'package:flutter/material.dart';
import '../Model/RegionModel.dart';

class RegionView extends StatelessWidget {
   final Future<List<Region>> region;

   RegionView({required this.region});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: regionBuilBody(context),
    );
  }

Widget regionBuilBody(BuildContext context) {
return Container(
  decoration:BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
      colors: [
        Colors.blueGrey,
        Colors.white70,
      ]
    ),
  ),
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Text("Kıta Kaşifi",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),),
      ),
      Text("Kıta Seçimi Yap",style: TextStyle(color: Colors.white),),
      Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: SizedBox(
          height: 500,
          child: FutureBuilder(future: region, builder: (context,snapshot){
            if(snapshot.hasData){
             var region = snapshot.data;
             return ListView.builder(
                 itemCount: region!.length,
                 itemBuilder: (context,index){
                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>RegionCountryView(region: region[index].regionName)));
                   },
                   child: SizedBox(
                     height: 75,
                     width: 75,
                     child: Card(
                       color: region[index].colorName,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 15.0),
                             child: Text(region[index].name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
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
      ),
      Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: SizedBox(
            width: 350,
            child: ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CountryPage()));
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E3A5F),
                  foregroundColor: Colors.white
                ),
                child: Row(
                  children: [
                    Icon(Icons.flight_takeoff),
                    Padding(
                      padding: const EdgeInsets.only(left: 75.0),
                      child: Text("Keşfetmeye Başla"),
                    ),
                  ],
                ))),
      )
    ],
  ),
);
}



}
