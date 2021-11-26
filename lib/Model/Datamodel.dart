// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class DataModel{
  String?id;
  String?name;
  String?company;
  String?orderId;
  String?invoicepaid;
  String?invoicePending;

Map<String ,dynamic>toMap(){
  return {
    "id":id, 
    "name":name,
    "company":company,
    "orderId":orderId,
    "invoicepaid":invoicepaid,
    "invoicePending":invoicePending,

    
  };

}

DataModel({
@required this.id,
@required this.name,
@required this.company,
@required this.orderId,
@required this.invoicepaid,
@required this.invoicePending,


});

 factory DataModel.fromMap(Map<String,dynamic>map){
   return DataModel(
     id:map["id"],
     name:map["name"],
     company: map["company"],
      orderId: map["orderId"],
        invoicepaid: map["invoicepaid"],
        invoicePending: map["invoicePending"],

   );
}
}