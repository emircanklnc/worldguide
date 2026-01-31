import 'package:country_app/Model/RegionModel.dart';
import 'package:flutter/material.dart';
class RegionViewModel {

Future<List<Region>> getRegion() async{


 List<Region> regionList = [];

 regionList.add(Region(name : "Asya",colorName: Color(0xFF1E3A5F)));
 regionList.add(Region(name: "Avrupa",colorName: Color(0xFF2D6A4F)));
 regionList.add(Region(name: "Afrika",colorName: Color(0xFFD97706)));
 regionList.add(Region(name: "Amerika",colorName: Color(0xFF3B82F6)));
 regionList.add(Region(name: "Okyanusya",colorName: Color(0xFF0D9488)));
 return regionList;
}
}