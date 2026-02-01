import 'package:country_app/Services/CountryServices.dart';
import 'package:flutter/material.dart';

import '../Model/CountryModel.dart';
import 'DetailCounrtyView.dart';

class RegionCountryView extends StatefulWidget {
  late String region;
  RegionCountryView({required this.region});

  @override
  State<RegionCountryView> createState() => _RegionCountryViewState();
}

class _RegionCountryViewState extends State<RegionCountryView> {
  late Future<List<Country>> cs;
  var tfCountry = TextEditingController();
  bool isSearch = false;
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
      body: regionCountryViewBuild(),
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

  Widget regionCountryViewBuild(){
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
        countries = countries.where((country){
          return country.region.toLowerCase().contains(widget.region.toLowerCase());
        }).toList();
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
