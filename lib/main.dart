import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/my_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale("ar")],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: const Locale('en'), 
      startLocale: const Locale('ar'), 
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

///easy_localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
///routes
    initialRoute: '/homeScreen',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/homeScreen': (context) => HomeScreen(),
  },

  theme: MyThemeData.lightMode,
  debugShowCheckedModeBanner: false,

    );
  }
}
