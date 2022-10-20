import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intership/screen/customerinfo.dart';
import 'package:flutter_intership/screen/sellerdetail.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        "assets/seller.jpg",
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Seller_Detail(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange, elevation: 0.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                            ),
                        child: const Text("Seller"),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 40,
                      width: 300,
                      
                      child: ElevatedButton(
                        
                         style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 41, 184, 184), elevation: 0.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                            
                            ),
                          
                        child: const Text("Customer"),
                      
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Customer_Info();
                            },
                          
                          ));
                        },
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
