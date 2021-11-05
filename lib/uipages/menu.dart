import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:settingspage/change_notifier/providers_functions.dart';

class Home extends StatelessWidget {
   const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  themeChanger.gettheme == ThemeMode.dark
                      ? "assets/images/darkback.jpg"
                      : "assets/images/back.jpeg",
                ),
                fit: BoxFit.cover),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 3.3,
                  decoration: BoxDecoration(
                    color: themeChanger.gettheme == ThemeMode.dark
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: makeListTIle(),
                          ),
                          makePhotoBox(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: makeProgressBar(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: makePlayerButtons(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row makePlayerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.skip_previous_outlined),
        Icon(Icons.fast_rewind_outlined),
        Icon(Icons.pause),
        Icon(Icons.fast_forward_outlined),
        Icon(Icons.skip_next_outlined)
      ],
    );
  }

  ProgressBar makeProgressBar() {
    return ProgressBar(
      progress: const Duration(seconds: 143),
      total: const Duration(minutes: 4),
      progressBarColor: Colors.red,
      baseBarColor: Colors.white.withOpacity(0.24),
      bufferedBarColor: Colors.white.withOpacity(0.24),
      thumbColor: Colors.white,
      barHeight: 3.0,
      thumbRadius: 5.0,
    );
  }

  Padding makePhotoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/david.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  ListTile makeListTIle() {
    return ListTile(
      title: Text(
        "Sensation one party",
        textAlign: TextAlign.left,
        style: GoogleFonts.actor(
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      ),
      subtitle: Text(
        "David G",
        style: GoogleFonts.actor(textStyle: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
