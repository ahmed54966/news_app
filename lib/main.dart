
import 'package:flutter/material.dart';
import 'package:news/home/home_screen.dart';




void main(){

const MyApp();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(


    initialRoute: '/homeScreen',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/homeScreen': (context) => HomeScreen(),
    

  },

  debugShowCheckedModeBanner: false,

    );
  }
}
