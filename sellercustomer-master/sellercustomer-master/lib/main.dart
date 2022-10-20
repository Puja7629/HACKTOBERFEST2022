import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intership/screen/customerinfo.dart';
import 'package:flutter_intership/screen/login_screen.dart';

 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 113, 95, 95),
        
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
    );
  }
}
