import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:settingspage/change_notifier/providers_functions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                child: Text(
                  "Apperence",
                  style: GoogleFonts.abel(
                      textStyle: const TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => themeChanger.setTheme(ThemeMode.light),
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: makeLightButton(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text("Light", style: GoogleFonts.oxygen()),
                              ),
                              Radio(
                                  value: ThemeMode.light,
                                  groupValue: themeChanger.gettheme,
                                  onChanged: themeChanger.setTheme)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => themeChanger.setTheme(ThemeMode.dark),
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: makeDarkButton(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text("Dark", style: GoogleFonts.oxygen()),
                              ),
                              Radio(
                                  value: ThemeMode.dark,
                                  groupValue: themeChanger.gettheme,
                                  onChanged: themeChanger.setTheme),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: makeCupertinoToggle(themeChanger),
                    ),
                  ],
                ),
              ),
              CupertinoFormSection(
                header: const Text("Section 1"),
                children: [
                  makeSliderRaw(themeChanger),
                  makeToggle(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "iPhone adjusts the screen brightness for current light conditions using the built-in ambient light sensor. Go to Settings > Accessibility. Tap Display & Text Size, then turn on Auto-Brightness.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row makeCupertinoToggle(ThemeChanger themeChanger) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Automatic",
          style: TextStyle(fontSize: 18),
        ),
        CupertinoSwitch(
          value: themeChanger.toggle,
          onChanged: (e) {
            themeChanger.settoggle = e;
          },
        ),
      ],
    );
  }

  CupertinoFormRow makeToggle() {
    return CupertinoFormRow(
      child: CupertinoSwitch(
        value: true,
        onChanged: (e) {},
      ),
      prefix: const Text("True Tone"),
    );
  }

  CupertinoFormRow makeSliderRaw(ThemeChanger themeChanger) {
    return CupertinoFormRow(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: CupertinoSlider(
                min: 0.0,
                max: 100,
                value: themeChanger.sliderIndex,
                onChanged: (e) {
                  themeChanger.setslide = e;
                },
              ),
            ),
          ),
          const Icon(
            CupertinoIcons.brightness_solid,
            size: 20.0,
          ),
        ],
      ),
      prefix: const Icon(
        CupertinoIcons.brightness,
        size: 20.0,
      ),
    );
  }

  ClipRRect makeDarkButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/images/dark.jpg",
        fit: BoxFit.cover,
        width: 100,
        height: 150,
      ),
    );
  }

  ClipRRect makeLightButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/images/light.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
