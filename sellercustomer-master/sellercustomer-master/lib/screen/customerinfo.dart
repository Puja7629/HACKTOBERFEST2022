import 'package:flutter/material.dart';
import 'package:flutter_intership/model/Dtabase.dart';
import 'package:flutter_intership/screen/Customer_Home.dart';
class Customer_Info extends StatefulWidget {
  const Customer_Info({Key? key}) : super(key: key);

  @override
  State<Customer_Info> createState() => _Customer_InfoState();
}

class _Customer_InfoState extends State<Customer_Info> {
   final formkey = GlobalKey<FormState>();
   DateTime today=DateTime.now();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController cityEditingController =
      TextEditingController();
  final TextEditingController zipEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController genderEditingController = TextEditingController();
  var _name;
  var _city;
  var _pin;
  var _age;
  var _gender;
  var _email;
  @override
  void initState() {
    super.initState();
    ageEditingController.text='${today.day}-${today.month}-${today.year}';
  }  

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
          cityEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.location_city),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    final zipField = TextFormField(
        autofocus: false,
        controller: zipEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          RegExp regex = RegExp(r'^.{5,}$');
          if (value!.isEmpty) {
            return ("Zip code not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid Zip code");
          }
          return null;
        },
        onSaved: (value) {
          zipEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.folder_zip),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Zip Code",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

   

    

    final ageField =  TextFormField(
            controller: ageEditingController,
             validator: (value) {
          if (value?.length !=2) {
            return "age must be  2 digit";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon:const Icon(Icons.calendar_today),
                  onPressed:(){
                    selectDate(context);
                  },
                ),
                // labelText: "DOB",
                hintText: "DOB",
                

                // labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              readOnly: true,
            );
        
    final genderField = TextFormField(
        autofocus: false,
        controller: genderEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          RegExp regex = RegExp(r'^.{1,}$');
          if (value!.isEmpty) {
            return ("gender not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter single character");
          }
          return null;
        },
        onSaved: (value) {
          genderEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "gender",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));
    final RegisterButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
           Database().AddCustomer(nameEditingController.text, cityEditingController.text, zipEditingController.text, today,genderEditingController.text,emailEditingController.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Customer_Home(emailEditingController.text)));
          // Register(emailController.text, passwordController.text);
        },
        child: const Text(
          "Register Now",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 37, 37),
        elevation: 0.0,
        // leading: IconButton(onPressed: (){
        //   Navigator.of(context).pop();
        // }, icon: const Icon(Icons.arrow_back,color:Colors.red)),
        title: const Text("Customer Details"),
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
                          "assets/cus1.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      nameField,
                      const SizedBox(
                        height: 20,
                      ),
                      emailField,
                      const SizedBox(
                        height: 20,
                      ),
                      cityField,
                      const SizedBox(
                        height: 20,
                      ),
                       ageField,
                      const SizedBox(
                        height: 20,
                      ),
                      zipField,
                      const SizedBox(
                        height: 20,
                      ),
                      genderField,
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
  Future<void> selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),);

    if(pickedDate!=null && pickedDate!=today){
      setState(() {
        today=pickedDate;
        ageEditingController.text='${today.day}-${today.month}-${today.year}';
      });
    }
  }
}




 