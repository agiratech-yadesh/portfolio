import 'package:flutter/material.dart';
import 'package:yadesh_portfolio/components/appbar.dart';
import 'package:yadesh_portfolio/components/contact_section.dart';
import 'package:yadesh_portfolio/components/download_button.dart';
import 'package:yadesh_portfolio/components/experience_section.dart';
import 'package:yadesh_portfolio/components/home_section.dart';
import 'package:yadesh_portfolio/components/skills_section.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey section1Key = GlobalKey();

  final GlobalKey section2Key = GlobalKey();

  final GlobalKey section3Key = GlobalKey();

  final GlobalKey section4Key = GlobalKey();

  Color _appBarColor = const Color(0XFFFAF6F0); 
  Color _textColor = Colors.black; 
  Color _buttonTextColor = Colors.white; 
  Color _buttonColor = Colors.black; 

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }





  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      appBar: ResponsiveAppBar(
        bgColor: _appBarColor,
        textColor: _textColor,
        buttonColor: _buttonColor,
        buttonTextColor: _buttonTextColor,
        section1Key: section1Key,
        section2Key: section2Key,
        section3Key: section3Key,
        section4Key: section4Key,
      ),
      endDrawer: isMobile
          ? Drawer(
              backgroundColor: const Color(0XFFF4EAE0),
              shape: const RoundedRectangleBorder(),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: _textColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          'Menu',
                          style:
                              TextStyle(color: _buttonTextColor, fontSize: 18),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: MyDownloadButton(buttonColor: _buttonTextColor, buttonTextColor: _buttonColor)
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      title: const Text('ABOUT'),
                      onTap: () {
                        scrollToSection(section1Key);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                      title: const Text('SKILLS'),
                      onTap: () {
                        scrollToSection(section2Key);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                      title: const Text('EXPERIENCE'),
                      onTap: () {
                        scrollToSection(section3Key);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                      title: const Text('CONTACT'),
                      onTap: () {
                        scrollToSection(section4Key);
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            )
          : null,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // Get the position of the section 3 key
          final RenderBox section3Box =
              section3Key.currentContext?.findRenderObject() as RenderBox;
          final offset = section3Box.localToGlobal(Offset.zero).dy;

          // If the section 3 is reached, change the app bar color
          if (scrollNotification.metrics.pixels > offset) {
            setState(() {
              _appBarColor = Colors.black;
              _textColor = Colors.white;
              _buttonTextColor = Colors.black;
              _buttonColor = const Color(0XFFF4DFC8);
            });
          } else {
            setState(() {
              _appBarColor = const Color(0XFFFAF6F0);
              _textColor = Colors.black;
              _buttonTextColor = Colors.white;
              _buttonColor = Colors.black;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeSection(sectionKey: section1Key),
              SkillsSection(sectionKey: section2Key),
              ExperienceSection(sectionKey: section3Key),
              ContactSection(sectionKey: section4Key),
            ],
          ),
        ),
      ),
    );
  }
}
