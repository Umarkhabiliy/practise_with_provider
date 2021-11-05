import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settingspage/change_notifier/providers_functions.dart';
import 'package:settingspage/uipages/connect_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          themeMode: themeChanger.gettheme,
          theme: ThemeData(
            iconTheme: const IconThemeData(color: Colors.black87,size: 26),
            radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => Colors.black87)),
            brightness: Brightness.light,
            primaryColor: Colors.black,
            backgroundColor: Colors.white,
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.black),
            ),
          ),
          darkTheme: ThemeData(radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => Colors.white),),
              brightness: Brightness.dark,
              backgroundColor: Colors.white,
              primaryColor: Colors.white,
              textTheme:
                  const TextTheme(bodyText2: TextStyle(color: Colors.white))),
          home: ConncetPages(),
        );
      }),
    );
  }
}

