import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CustomerProduct extends StatelessWidget {
  String category="";
  CustomerProduct(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('Product').where('category',isEqualTo: category).snapshots(),
      builder:(context,snapshot){
        if(!snapshot.hasData){  
          return const Center(
            child:CircularProgressIndicator(),
          );
        }
        return ListView.builder(
           padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          primary:true,
          itemCount:snapshot.data!.docs.length,
          itemBuilder:(context,index){
          QueryDocumentSnapshot x=snapshot.data!.docs[index];
          return ListTile(
            
            tileColor:Colors.redAccent,
            
            shape:RoundedRectangleBorder(
              side:const BorderSide(color:Colors.white,width:1),
              borderRadius:BorderRadius.circular(15)
            ),

            title:Text(x['name'],style:const TextStyle(fontSize:25,color:Colors.white,fontWeight:FontWeight.bold)),

            subtitle:Text('Brand:-${x['brand']}',style:const TextStyle(fontSize:15,color:Colors.white,fontWeight:FontWeight.bold)),

          trailing:TextButton(
            onPressed: (){
            }, 
            child: Text('Price:-${x['price']} Rs/-',style:const TextStyle(fontSize:15,color:Colors.white)),
          ),
          );
          },
          );
        });
  }
}