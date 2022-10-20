// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerProduct extends StatelessWidget {
  String Email="";
  SellerProduct(this.Email,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('Seller').doc(Email).collection('Product').snapshots(),
      builder:(context,snapshot){
        if(!snapshot.hasData){  
          return Center(
            child:CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          primary:true,
          itemCount:snapshot.data!.docs.length,
          itemBuilder:(context,index){
          QueryDocumentSnapshot x=snapshot.data!.docs[index];
          
          
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor:Colors.redAccent,
            shape:RoundedRectangleBorder(
              side:BorderSide(color:Colors.white,width:1),
              borderRadius:BorderRadius.circular(15)
              
            ),
            

            title:Text(x['name'],style:TextStyle(fontSize:25,color:Colors.white,fontWeight:FontWeight.bold)),

            subtitle:Text('Brand:-${x['brand']} \nseller:-$Email',style:TextStyle(fontSize:15,color:Colors.white,fontWeight:FontWeight.bold)),

          trailing:TextButton(
            onPressed: (){
            }, 
            child: Text('Price:-${x['price']} Rs/-',style:TextStyle(fontSize:15,color:Colors.white)),
          ),
          );
          },
          );
        });
  }
}