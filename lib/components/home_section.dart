import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);

    return Container(
      key: sectionKey,
      // height: MediaQuery.of(context).size.height,
      color: const Color(0XFFFAF6F0),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth > 1200
              ? 200
              : screenWidth > 800
                  ? 100
                  : 20,
                  vertical: 200
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/landing.png',
                            width: screenWidth * 0.3,
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
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/landing.png',
                          width: screenWidth * 0.5,
                        ),
                        const SizedBox(height: 20),
                        introTextWidget(context),
                      ],
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget introTextWidget(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          textDirection: TextDirection.rtl,
          text: TextSpan(
            
            text: "Hello I'am ",
            style: TextStyle(
              

              fontSize: screenWidth > 900
                  ? 50
                  : 30, 
              color: Colors.black,
              fontWeight: FontWeight.w200,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'YADESH KUMAR V',
                style: TextStyle(
                  fontSize: screenWidth > 900
                      ? 50
                      : 30, // Adjust font size based on screen size
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textDirection: TextDirection.rtl,
          text: TextSpan(
            text: "Flutter ",
            style: TextStyle(
              fontSize: screenWidth > 900
                  ? 50
                  : 30, 
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[


               TextSpan(
                text: 'Developer',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: screenWidth > 900
                      ? 50
                      : 30, 
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: screenWidth > 800
              ? 700
              : screenWidth * 0.9, 
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Integer nec velit vitae libero blandit consequat. Cras pharetra eros ac urna molestie, in vehicula lectus venenatis. Proin posuere, turpis at convallis scelerisque, purus sapien lacinia orci, eget malesuada felis sapien nec libero.',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Color(0XFF0E0E20)),
          ),
        ),
        const SizedBox(height: 10),
        socialIconsRow(context), 
      ],
    );
  }

  Widget socialIconsRow(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth > 800
          ? 700
          : screenWidth * 0.9, 
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    onPressed: () async {
      final Uri uri = Uri.parse(url);

      // Handle mailto URLs separately
      if (url.startsWith('mailto:')) {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      } else {
        // Handle other URLs
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      }
    },
    icon: Image.asset(
      asset,
      width: 22,
    ),
  );
}

}
