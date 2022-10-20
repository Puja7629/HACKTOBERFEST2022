import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Database{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void AddSeller(String name,String bussinessName,String email,String city,String category,String phone){
    FirebaseFirestore.instance.collection('Seller').doc(email).collection('Bussiness').add({
      'Bussiness name': bussinessName,
      'category':category,
      'email':email,
      'phone':phone,
      'name':name,
      'city':city,
    });
    print('Seller Added Successfully!');
  }
  void AddProduct(String brand,String name,String category,int price,String email){
    FirebaseFirestore.instance.collection('Seller').doc(email).collection('Product').add({
      'brand': brand,
      'category':category,
      'name':name,
      'price':price,
    });
    print("Product Added Successfully!");
  }
  void Product(String brand,String name,String category,int price,String email){
    FirebaseFirestore.instance.collection('Product').add({
      'brand': brand,
      'category':category,
      'name':name,
      'price':price,
      'email':email,
    });
  }

  void AddCustomer(String name,String city,String zip,DateTime age,String gender,String email){
    DateTime today=DateTime.now();
    FirebaseFirestore.instance.collection('Customer').doc(email).collection('Details').add({
      'name': name,
      'city':city,
      'zip':zip,
      'Age':today.year-age.year,
      'gender':gender,
      'email':email,
    });
    print('Customer Added Successfully!');
  }

  Future signOut() async {
    await _auth.signOut();
    print('signout');
  }
}