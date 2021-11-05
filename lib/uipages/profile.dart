import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settingspage/change_notifier/providers_functions.dart';

class Profile extends StatelessWidget {
   const  Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                crossFadeState: Theme.of(context).brightness == Brightness.light
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: GestureDetector(
                  onTap: () => themeChanger.setTheme(ThemeMode.dark),
                  child: Container(
                    color: Colors.black,
                    width: 200,
                    height: 200,
                  ),
                ),
                secondChild: GestureDetector(
                  onTap: () => themeChanger.setTheme(ThemeMode.light),
                  child: Container(
                    color: Colors.white,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            RadioListTile(
                title: const Text("Light Mode"),
                value: ThemeMode.light,
                groupValue: themeChanger.gettheme,
                onChanged: themeChanger.setTheme),
            RadioListTile(
                title: const Text("Darfk Mode"),
                value: ThemeMode.dark,
                groupValue: themeChanger.gettheme,
                onChanged: themeChanger.setTheme),
            RadioListTile(
                title: const Text("System Mode"),
                value: ThemeMode.system,
                groupValue: themeChanger.gettheme,
                onChanged: themeChanger.setTheme),
            CupertinoSwitch(
              value: themeChanger.gettheme == ThemeMode.dark ? true : false,
              onChanged: (e) {
                if (e = true) {
                  themeChanger.setTheme(ThemeMode.dark);
                } else if (e = false) {
                  themeChanger.setTheme(ThemeMode.light);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
