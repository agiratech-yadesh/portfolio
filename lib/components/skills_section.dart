import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.sectionKey});
  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<String> icons = [
      'assets/images/flutter_icon.png',
          'assets/images/git_icon.png',
          'assets/images/dart_icon.png',
          'assets/images/firebase_icon.png',
          'assets/images/figma_icon.png',
    ];

    final List<String> skills = [
      'Flutter',
      'Git',
      'Dart',
      'Firebase',
      'Figma',
    ];

    int crossAxisCount;
    double padding;
        double padding2;


    if (screenWidth > 1200) {
      crossAxisCount = 5;
      padding = 200;
            padding2 = 100;

    } else if (screenWidth > 800) {
      crossAxisCount = 4;
      padding = 100;
            padding2 = 50;

    } else if (screenWidth > 600) {
      crossAxisCount = 2;
      padding = 50;
            padding2 = 25;

    } else {
      crossAxisCount = 2;
      padding = 20;
            padding2 = 10;

    }

    return Container(
      color: const Color(0XFFFAF6F0),
      key: sectionKey,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding2),
        child: Column(
          children: [
            // const SizedBox(height: 100),
            RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text: "My ",
                style:  TextStyle(
                      fontSize: screenWidth > 600 ? 50 : 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Skills',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: screenWidth > 600 ? 50 : 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.2,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (index == 1 || index == 8) ? const Color(0XFFF4EAE0) : Colors.black,
                      border: Border.all(width: 0.6, color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            icons[index],
                            width: 50,
                            height: 60,
                      color: (index == 1 || index == 8) ? Colors.black : Colors.white,
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            skills[index],
                            style: TextStyle(
                              fontSize: 18,
                      color: (index == 1 || index == 8) ? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
