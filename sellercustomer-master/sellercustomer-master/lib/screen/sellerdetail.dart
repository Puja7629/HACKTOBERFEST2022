import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intership/model/Dtabase.dart';
import 'package:flutter_intership/screen/Sellerhome.dart';

class Seller_Detail extends StatefulWidget {
  const Seller_Detail({Key? key}) : super(key: key);

  @override
  State<Seller_Detail> createState() => _Seller_DetailState();
}

class _Seller_DetailState extends State<Seller_Detail> {
  final _auth=FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController buisnessNameEditingController =
      TextEditingController();
  final TextEditingController cityEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController categoryEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Name can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid name");
          }
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    final buisnessField = TextFormField(
        autofocus: false,
        controller: buisnessNameEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          RegExp regex = RegExp(r'^.{5,}$');
          if (value!.isEmpty) {
            return ("Name can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid name");
          }
          return null;
        },
        onSaved: (value) {
          buisnessNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.business),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Buisness Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("please enter your Email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    final cityField = TextFormField(
        autofocus: false,
        controller: cityEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("city is required");
          }
          if (!regex.hasMatch(value)) {
            return ("please enter valid city");
          }
          return null;
        },
        onSaved: (value) {
          phoneEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.location_city),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    final phoneField = TextFormField(
        autofocus: false,
        controller: phoneEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value?.length != 10) {
            return "mobile number must be 10 digit";
          }
          return null;
        },
        onSaved: (value) {
          phoneEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone_android),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));
    final RegisterButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 249, 237, 69),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Database().AddSeller(nameEditingController.text,buisnessNameEditingController.text,emailEditingController.text,cityEditingController.text,categoryEditingController.text,phoneEditingController.text);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Seller_Home(emailEditingController.text)));
        },
        child: const Text(
          "Register Now",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    
        

    String Dvalue="Electronics";
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

    final dropdownmenu = TextFormField(
            controller: categoryEditingController,
             autofocus: false,
          
              decoration: InputDecoration(
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                   decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
            
        ),

                  child: DropdownButton(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(60),
                    dropdownColor: Colors.redAccent,
                    value:Dvalue,
                    icon:const Icon(Icons.keyboard_arrow_down), 
                    items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
              }).toList(),
              onChanged: (String? newValue) {
                  setState(() {
                    Dvalue = newValue!;
                    categoryEditingController.text=Dvalue;
                  });
              },),
                ),
              
                // labelText: "Category",
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                 hintText: "Categories",
                 prefixIcon: const Icon(Icons.category),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              readOnly: true,
            );
          
    
    
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 37, 37),
        elevation: 0.0,
        title: const Text("Seller Details"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 140,
                        child: Image.asset(
                          "assets/sell6.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      nameField,
                      const SizedBox(
                        height: 20,
                      ),
                      buisnessField,
                      const SizedBox(
                        height: 20,
                      ),
                      emailField,
                      const SizedBox(
                        height: 20,
                      ),
                      cityField,
                      const SizedBox(
                        height: 30,
                      ),
                       dropdownmenu,
                      const SizedBox(
                        height: 30,
                      ),
                      phoneField,
                      const SizedBox(
                        height: 20,
                      ),
                      RegisterButton,
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}


