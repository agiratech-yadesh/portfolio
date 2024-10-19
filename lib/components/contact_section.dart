import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      key: sectionKey,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 150),
            const Spacer(),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth > 1200
                          ? 200
                          : screenWidth > 800
                              ? 100
                              : 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'Your name',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'Your email',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'Your websit (if any)',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                style: TextStyle(color: Colors.white),
                                maxLines: 5,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'How can I help?*',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 50),
                                      backgroundColor: const Color(0XFFF4DFC8),
                                    ),
                                    child: const Text(
                                      'Get In Touch',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.05,
                        ),
                        Flexible(
                          flex: 1,
                          child: introTextWidget(context),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth > 1200
                          ? 200
                          : screenWidth > 800
                              ? 100
                              : 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Your name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Your email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Your websit (if any)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'How can I help?*',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              backgroundColor: const Color(0XFFF4DFC8),
                            ),
                            child: const Text(
                              'Get In Touch',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        introTextWidget(context),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                }
              },
            ),
            const Spacer(),
            Align(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                width: double.maxFinite,
                // height: MediaQuery.of(context).size.height * 0.1,
                color: const Color(0XFFF4DFC8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Feel free to reach out for collaborations or just a friendly chat!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth >= 900 ? 18 : 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Build using',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth >= 900 ? 18 : 14),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          'assets/images/flutterLogo.png',
                          width: screenWidth >= 900 ? 20 : 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          ' - Yadesh Kumar V 2024',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth >= 900 ? 18 : 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget introTextWidget(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textDirection: TextDirection.rtl,
          text: const TextSpan(
            text: "Let's ",
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'talk  ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
              TextSpan(
                text: "for",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
        const Text(
          'Something special',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: screenWidth > 800 ? 700 : screenWidth * 0.9,
          child: const Text(
            'I seek to push the limits of creativity to create high-engaging, user-friendly, and memorable interactive experiences.',
            style: TextStyle(color: Colors.white54),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'yadeshkumar54@gmail.com',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
