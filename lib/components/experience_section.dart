import 'package:flutter/material.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key, required this.sectionKey});
  final GlobalKey sectionKey;

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    double padding2;

    if (screenWidth > 1200) {
      padding = 100;
      padding2 = 50;
    } else if (screenWidth > 800) {
      padding = 100;
      padding2 = 50;
    } else if (screenWidth > 600) {
      padding = 50;
      padding2 = 25;
    } else {
      padding = 20;
      padding2 = 10;
    }

    return Container(
      key: widget.sectionKey,
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding2),
        child: Column(
          children: [
            // const SizedBox(height: 100),

            RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text: "My ",
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 50 : 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Experience',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: screenWidth > 600 ? 50 : 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Check if the width is small enough to stack the elements vertically
                      if (constraints.maxWidth < 900) {
                        // Display in a column for small screens
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(
                                'assets/images/agiraLogo.jpeg',
                                scale: 6,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Associate software engineer at Agira GPMV Software Technologies',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'April 2024 - Present',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      } else {
                        // Display in a row for larger screens
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(
                                'assets/images/agiraLogo.jpeg',
                                scale: 6,
                              ),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.02,
                            // ),
                            const Text(
                              'Associate software engineer at Agira GPMV Software Technologies',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // const Spacer(),
                            const Text(
                              'April 2024 - Present',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec nisl nec libero fermentum blandit. Proin non volutpat enim. Mauris euismod, libero sed varius gravida, lacus nunc hendrerit elit, sed porttitor erat felis id mi. Duis gravida massa ac velit ornare, vel scelerisque dolor vulputate. Nulla facilisi. Curabitur ac orci lacus. Aenean elementum felis vel nulla facilisis, eget commodo nulla ultricies. Ut interdum, magna nec convallis gravida, lacus felis vulputate enim, ut tristique justo enim et libero. Aliquam vel tristique nisl. Vestibulum eu diam non libero euismod pharetra vel sit amet dui.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 75, 74, 74),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Check if the width is small enough to stack the elements vertically
                      if (constraints.maxWidth < 900) {
                        // Display in a column for small screens
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(
                                'assets/images/agiraLogo.jpeg',
                                scale: 6,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Intern at Agira GPMV Software Technologies',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'December 2023 - April 2024',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      } else {
                        // Display in a row for larger screens
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(
                                'assets/images/agiraLogo.jpeg',
                                scale: 6,
                              ),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.02,
                            // ),
                            const Text(
                              'Intern at Agira GPMV Software Technologies',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // const Spacer(),
                            const Text(
                              'December 2023 - April 2024',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec nisl nec libero fermentum blandit. Proin non volutpat enim. Mauris euismod, libero sed varius gravida, lacus nunc hendrerit elit, sed porttitor erat felis id mi. Duis gravida massa ac velit ornare, vel scelerisque dolor vulputate. Nulla facilisi. Curabitur ac orci lacus. Aenean elementum felis vel nulla facilisis, eget commodo nulla ultricies. Ut interdum, magna nec convallis gravida, lacus felis vulputate enim, ut tristique justo enim et libero. Aliquam vel tristique nisl. Vestibulum eu diam non libero euismod pharetra vel sit amet dui.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
