import 'package:flutter/material.dart';

class ProgressCircle {
  final BuildContext context;
  bool isShowing = false;

  ProgressCircle(this.context);

  showProgressBar({String? text}) {
    if (isShowing) {
      hideProgressBar();
    }
    isShowing = true;

    showDialog(
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/favicon.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0XFF283891)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void hideProgressBar() {
    if (isShowing) {
      Navigator.pop(context);
      isShowing = false;
    }
  }
}
