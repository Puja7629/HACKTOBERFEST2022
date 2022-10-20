// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_intership/screen/Selleraddproduct.dart';
import 'package:flutter_intership/screen/login_screen.dart';

import '../model/Dtabase.dart';
import 'SellerProduct.dart';
class Seller_Home extends StatefulWidget {
  String email='';
  Seller_Home(this.email,{Key? key}) : super(key: key);

  @override
  State<Seller_Home> createState() => _Seller_HomeState();
}

class _Seller_HomeState extends State<Seller_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        
        title:const Text('Seller Products',style:TextStyle(color:Colors.white,fontSize:30)),
        centerTitle: true,

        actions:  [
          IconButton(
            onPressed: (){
              Database().signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }, 
            icon: Icon(Icons.logout),
            )
        ]),
        
        
      

      floatingActionButton: FloatingActionButton(
      
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct(widget.email)));
        },
        child:const Icon(Icons.add,color:Colors.white),
      ),

       body:SingleChildScrollView(
        child: Column(
           children: [
             SellerProduct(widget.email),
         ]),
       ),
    );
  }
}