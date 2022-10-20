import 'package:flutter/material.dart';
import 'package:flutter_intership/model/Dtabase.dart';
import 'package:flutter_intership/screen/CustomerProduct.dart';
import 'package:flutter_intership/screen/login_screen.dart';

class Customer_Home extends StatefulWidget {
  String email = "";
  Customer_Home(this.email, {Key? key}) : super(key: key);

  @override
  State<Customer_Home> createState() => _Customer_HomeState();
}

class _Customer_HomeState extends State<Customer_Home> {
  String Dvalue = "Electronics";
  
  var items = [
    'Electronics',
    'Accessories',
    'Fashion',
    'Grocceries',
    'Kids',
    'Household',
    'Men',
    'Women',
  ];
  var category = "";
  @override
  void initState() {
    super.initState();
    category = Dvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Customer Products',
              style: TextStyle(color: Colors.white, fontSize: 30)),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Database().signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: const Icon(Icons.logout)),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddProduct()));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(padding: EdgeInsets.all(10)),
          DecoratedBox(
             decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
          Colors.redAccent,
          Colors.blueAccent,
          Colors.purpleAccent
          //add more colors
          ]),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
          blurRadius: 5) //blur radius of shadow
      ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButton(
                value: Dvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    Dvalue = newValue!;
                    category = Dvalue;
                  });
                },
                isExpanded: true,
                underline: Container(),
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                dropdownColor: Colors.redAccent,
                iconEnabledColor: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          CustomerProduct(category),
        ]),
      ),
    );
  }
}
