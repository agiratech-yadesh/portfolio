import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          height: 20,
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Your email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        introTextWidget(context),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                }
              },
            ),
            const Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.maxFinite,
                height: 80,
                color: const Color(0XFFF4DFC8),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Feel free to reach out for collaborations or just a friendly chat!',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '© Yadesh Kumar V 2024.',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
          text: TextSpan(
            text: "Let's ",
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'talk ',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = .3
                    ..color = Colors.white,
                ),
              ),
              const TextSpan(
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

  Widget socialIconsRow(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth > 800 ? 700 : screenWidth * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          socialIconButton('assets/images/linkedin.png',
              'https://www.linkedin.com/in/yadesh-kumar-5649791b4/'),
          const SizedBox(width: 18),
          socialIconButton('assets/images/github.png',
              'https://github.com/agiratech-yadesh'),
          const SizedBox(width: 18),
          socialIconButton(
              'assets/images/mail.png', 'mailto:yadeshkumar54@gmail.com'),
        ],
      ),
    );
  }

  Widget socialIconButton(String asset, String url) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      icon: Image.asset(
        asset,
        width: 22,
      ),
    );
  }
}
