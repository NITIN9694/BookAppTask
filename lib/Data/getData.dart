 // ignore: file_names
 // ignore: file_names
 // ignore: file_names
 // ignore: file_line

 // ignore_for_file: avoid_print
 
import 'dart:convert';

import 'package:bookapptask/Model/Datamodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
 
 Future <List<DataModel>?> getMovie ()async{
  Uri url =Uri.parse("https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6");
  final response = await http.get(url);  
  print(response);
  if(response.statusCode ==200){
   Map<String,dynamic> map = json.decode(response.body) ;
   List _result =map["clients"];
List<DataModel>_movielist=_result.map((jsonData) =>DataModel.fromMap(jsonData) ).toList();
    return _movielist;
   
  }else{

    print("errror");
    return [];
  }
}
