// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors


import 'dart:developer';

import 'package:bookapptask/Data/getData.dart';
import 'package:bookapptask/Model/Datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<DataModel>?_datamodel;
  bool _isloding =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovie().then((value){
   setState(() {
     
     if(value!.isNotEmpty){
       _datamodel = value;
       _isloding =true;
     }else{
       print({"data is not init"});
     }
   });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BookApp"),
      ),
      body: Container(
       
        child:
         ListView.builder(
           scrollDirection: Axis.vertical,
          itemCount: _datamodel!.length,
          itemBuilder: (context,index){
          return 
            _isloding? Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
              child: Container(
                 decoration:BoxDecoration
        (
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
         // ignore: prefer_const_literals_to_create_immutables
         boxShadow: [
          BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
         ]
        ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_datamodel![index].id.toString()),
                    Text(_datamodel![index].name.toString()),
                    Text(_datamodel![index].orderId.toString()),
                    Text(_datamodel![index].name.toString()),
                    Text(_datamodel![index].invoicePending.toString()),
                    Text(_datamodel![index].invoicepaid.toString())

                  ],
                ),
              ),
            ):CircularProgressIndicator();
           
            
          
          }
   
        ),
        
        ),
    );
  }
}