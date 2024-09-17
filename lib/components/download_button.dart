import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For loading assets
import 'dart:io' as io; // For mobile platforms
import 'package:path_provider/path_provider.dart'; // For saving files on mobile
import 'package:universal_html/html.dart' as html; // For web downloads

class MyDownloadButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTextColor;

  const MyDownloadButton({super.key, 
    required this.buttonColor,
    required this.buttonTextColor,
  });

  Future<void> _downloadPdf(BuildContext context) async {
    // Load PDF from assets
    ByteData bytes = await rootBundle.load('images/resume/yadesh_resume.pdf');
    Uint8List pdfData = bytes.buffer.asUint8List();

    // Check if running on the web platform
    if (identical(0, 0.0)) {
      // Web platform download
      final blob = html.Blob([pdfData]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "yadesh's_resume.pdf")
        ..click();
      html.Url.revokeObjectUrl(url);
      
    } else {
      // Mobile platform (Android/iOS)
      final directory = await getApplicationDocumentsDirectory();
      final file = io.File("${directory.path}/yadesh's_resume.pdf");
      await file.writeAsBytes(pdfData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resume downloaded at ${file.path}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _downloadPdf(context),
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Resume',
            style: TextStyle(color: buttonTextColor),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.file_download_outlined,
            color: buttonTextColor,
          ),
        ],
      ),
    );
  }}