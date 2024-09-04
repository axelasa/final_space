import 'package:final_space/pages/characters.dart';
import 'package:final_space/pages/episodes.dart';
import 'package:final_space/pages/locations.dart';
import 'package:final_space/pages/quotes.dart';
import 'package:final_space/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const CharactersPage();

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = const CharactersPage ();
        break;
      case 1:
        currentWidgetPage = const EpisodesPage ();
        break;

      case 2:
        currentWidgetPage = const LocationsPage();
        break;

      case 3:
        currentWidgetPage = const QuotesPage();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(children: [
        Expanded(
          child: navBarItem(Icons.person_2_outlined, 0, 'characters', true),
        ),
        Expanded(
          child: navBarItem(Icons.video_camera_back_outlined, 1, 'Episodes', true),
        ),
        Expanded(
          child: navBarItem(Icons.location_on_outlined, 2, 'Locations', true),
        ),
        Expanded(
          child: navBarItem(Icons.text_snippet_outlined, 3, 'Quotes', true),
        )
      ]),
      body: currentWidgetPage,
    );
  }

  Widget navBarItem(IconData icon, int index, String label, bool visible) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Container(
          height: 56,
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 26.0,
                color: index == selectedIndex
                    ? AppColors.mainColor
                    : const Color(0xff999999),
              ),
              Text(
                label,
                style: GoogleFonts.akshar(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
