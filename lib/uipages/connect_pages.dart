import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settingspage/change_notifier/providers_functions.dart';
import 'package:settingspage/uipages/menu.dart';
import 'package:settingspage/uipages/profile.dart';
import 'package:settingspage/uipages/settigns.dart';

class ConncetPages extends StatelessWidget {
  ConncetPages({Key? key}) : super(key: key);

  var currentTab = [
    Home(),
    Profile(),
  const  SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeChanger>(context);
    return Scaffold(
      backgroundColor:const  Color(0xFFEEEEEE),
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.setIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.photo), label: "Media"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
