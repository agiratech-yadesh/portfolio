import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io' as io; // for mobile
import 'package:path_provider/path_provider.dart'; // for mobile
import "package:universal_html/html.dart" as html;
import 'package:yadesh_portfolio/components/download_button.dart'; // for web (universal_html)

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey section1Key;
  final GlobalKey section2Key;
  final GlobalKey section3Key;
  final GlobalKey section4Key;
  final GlobalKey section5Key;

  final Color bgColor;
  final Color textColor;
  final Color buttonTextColor;
  final Color buttonColor;

  const ResponsiveAppBar({
    super.key,
    required this.section1Key,
    required this.section2Key,
    required this.section3Key,
    required this.section4Key,
    required this.section5Key,
    required this.bgColor,
    required this.textColor,
    required this.buttonTextColor,
    required this.buttonColor,
  });

  Future<void> _downloadPdf(BuildContext context) async {
    // Check platform
    if (io.Platform.isAndroid || io.Platform.isIOS) {
      // For Mobile (Android, iOS)
      final bytes = await rootBundle.load('assets/resume/yadesh_resume.pdf');
      final dir = await getApplicationDocumentsDirectory();
      final file = io.File('${dir.path}/sample.pdf');
      await file.writeAsBytes(bytes.buffer.asUint8List());

      // Optionally, use a package like 'open_file' to open the file after download
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved at ${file.path}')),
      );
    } else {
      // For Web
      final bytes = await rootBundle.load('assets/sample.pdf');
      final blob = html.Blob([bytes.buffer.asUint8List()]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "sample.pdf")
        ..click();
      html.Url.revokeObjectUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return AppBar(
      iconTheme: IconThemeData(color: textColor),
      backgroundColor: bgColor,
      elevation: 0,
      toolbarHeight: 100,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: isMobile ? _buildMobileAppBar() : _buildDesktopAppBar(context),
    );
  }

  // For Desktop screens
  Widget _buildDesktopAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'WELCOME !',
          style: TextStyle(
            color: Color(0XFFA9927D),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => scrollToSection(section1Key),
              icon: Text(
                'ABOUT',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            IconButton(
              onPressed: () => scrollToSection(section2Key),
              icon: Text(
                'SKILLS',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            IconButton(
              onPressed: () => scrollToSection(section5Key),
              icon: Text(
                'PROJECTS',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            IconButton(
              onPressed: () => scrollToSection(section3Key),
              icon: Text(
                'EXPERIENCE',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            IconButton(
              onPressed: () => scrollToSection(section4Key),
              icon: Text(
                'CONTACT',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            MyDownloadButton(
              buttonColor: buttonColor,
              buttonTextColor: buttonTextColor,
            )
          ],
        ),
      ],
    );
  }

  // For Mobile screens
  Widget _buildMobileAppBar() {
    return const Text(
      'WELCOME !',
      style: TextStyle(
        color: Color(0XFFA9927D),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

void scrollToSection(GlobalKey key) {
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: const Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}
