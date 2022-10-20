import 'package:flutter/material.dart';
import 'package:flutter_intership/model/Dtabase.dart';
class AddProduct extends StatefulWidget {
  String email='';
  AddProduct(this.email,{Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
    final formkey = GlobalKey<FormState>();
  final TextEditingController brandEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController priceEditingController =
      TextEditingController();
      final TextEditingController category=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final brandField = TextFormField(
      autofocus: false,
      controller: brandEditingController,
      keyboardType: TextInputType.text,
      validator: (value){
          RegExp regex =RegExp(r'^.{3,}$');
             if(value!.isEmpty){
              return("Brand can not be empty");
             }
             if(!regex.hasMatch(value)){
              return("Enter valid barnd(min 3 character");
             }
             return null;
          
                  },
      onSaved: (value) {
        brandEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.branding_watermark),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Brand Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ));

      final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
          RegExp regex =RegExp(r'^.{3,}$');
             if(value!.isEmpty){
              return("name can not be empty");
             }
             if(!regex.hasMatch(value)){
              return("Enter valid name(min 3 character");
             }
             return null;
          
                  },
      onSaved: (value) {
        brandEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ));


      final priceField = TextFormField(
      autofocus: false,
      controller: priceEditingController,
      keyboardType: TextInputType.number,
      validator: (value){
          // RegExp regex =RegExp(r'^.{3,}$');
             if(value!.isEmpty){
              return("price can not be empty");
             }
             return null;
          
                  },
      onSaved: (value) {
        priceEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.price_change),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Price",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ));

      
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
            controller: category,
             autofocus: false,
          
              decoration: InputDecoration(
                suffixIcon: DropdownButton(
                  elevation: 7,
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
                  category.text=Dvalue;
                });
              },),
              
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

    final AddProductButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 198, 24, 24),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Database().AddProduct(brandEditingController.text,nameEditingController.text,category.text,int.parse(priceEditingController.text),widget.email);
          Database().Product(brandEditingController.text,nameEditingController.text,category.text,int.parse(priceEditingController.text),widget.email);

          Navigator.pop(context);
           
        },
        child: const Text(
          "Add Product",
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
        title: const Text("Add Product"),
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
                        height: 120,
                        child: Image.asset(
                          "assets/seller5.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      brandField,
                      const SizedBox(
                        height: 20,
                      ),
                      nameField,
                      const SizedBox(
                        height: 20,
                      ),
                      dropdownmenu,
                      const SizedBox(
                        height: 20,
                      ),
                      priceField,
                      const SizedBox(
                        height: 20,
                      ),
                      AddProductButton,
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