import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For loading assets
import 'package:open_file/open_file.dart';
import 'dart:io' as io; // For mobile platforms
import 'package:path_provider/path_provider.dart'; // For saving files on mobile
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_html/html.dart' as html;

class MyDownloadButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonTextColor;

  const MyDownloadButton({
    super.key,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  Future<PermissionStatus> checkAndRequestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status;
  }

  Future<void> _downloadPdf(BuildContext context) async {
    // Load PDF from assets
    ByteData bytes =
        await rootBundle.load('assets/images/resume/yadesh_resume.pdf');
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



  // Request storage permission
  // var status = await checkAndRequestPermission();

  // if (status.isGranted) {
    try {
      // Get the Downloads directory
      final directory = await getExternalStorageDirectory();
      final downloadsDirectory = io.Directory('${directory!.path}/Download');
      if (!await downloadsDirectory.exists()) {
        await downloadsDirectory.create(recursive: true);
      }

      final file = io.File("${downloadsDirectory.path}/yadesh's_resume.pdf");

      // Write PDF data to file
      await file.writeAsBytes(pdfData);

                                  Navigator.of(context).pop();


      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Resume downloaded successfully'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            textColor: Colors.white,
            
            label: 'Open',
            onPressed: () async {

              final result = await OpenFile.open(file.path);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Failed to open file'),
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 3),
                  ),
                );
              
            },
          ),
        ),
      );
    } catch (e) {
      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to download resume'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  // } else {
  //   // Show permission request SnackBar
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: const Text('Storage permission is required'),
  //       behavior: SnackBarBehavior.floating,
  //       margin: const EdgeInsets.all(20),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(4),
  //       ),
  //       backgroundColor: Colors.red,
  //       duration: const Duration(seconds: 3),
  //     ),
  //   );
  // }
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
  }
}
