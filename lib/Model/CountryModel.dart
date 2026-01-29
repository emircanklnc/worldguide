
class Country {
  late Flags flags;
  late Name name;
  late String cca2;
  late List<String> capital;
  late String region;
  late Map<String,String> languages;
  late int population;

  Country(
      this.flags,
      this.name,
      this.cca2,
      this.capital,
      this.region,
      this.languages,
      this.population,
      );

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      Flags.fromJson(json["flags"]),
      Name.fromJson(json["name"]),
      json["cca2"] ?? "",
      List<String>.from(json["capital"] ?? []),
      json["region"] ?? "",
      Map<String,String>.from(json["languages"] ?? {}),
      json["population"] ?? 0,
    );
  }
}


class Flags{
 late String png;
 late String svg;
 late String alt;

 Flags(this.png, this.svg, this.alt);

 factory Flags.fromJson(Map<String,dynamic> json){
   return Flags(json["png"] as String, json["svg"] as String, json["alt"] as String);
 }
}

class NativeLanguage{
  late String official;
  late String common;

  NativeLanguage(this.official, this.common);

  factory NativeLanguage.fromJson(Map<String,dynamic> json){
    return NativeLanguage(json["official"] as String, json["common"] as String);
  }

}
class NativeName{
  late Map<String,NativeLanguage> languages;

  NativeName(this.languages);
  
 factory NativeName.formJson(Map<String,dynamic> json){
   final Map<String,NativeLanguage> map = {};
   json.forEach((key,value){
     map[key]=NativeLanguage.fromJson(value);
   });
   return NativeName(map);
 }
}
class Name{
  late String common;
  late String official;
  late NativeName nativeName;

  Name(this.common, this.official, this.nativeName);

  factory Name.fromJson(Map<String,dynamic> json){
   return Name(json["common"] as String, json["official"] as String, NativeName.formJson(json["nativeName"]));
  }
}





class Languages{
  late Map<String,String> language;

  Languages(this.language);
  factory Languages.fromJson(Map<String,dynamic>json){
    return Languages(Map<String,String>.from(json) ?? {});
  }

}


