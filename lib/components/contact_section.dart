import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yadesh_portfolio/components/progress_indicator.dart';

class ContactSection extends StatefulWidget {
  ContactSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final websiteController = TextEditingController();

  final messageController = TextEditingController();

  @override
  void dispose() {
    // Make sure to dispose of the controllers when not needed to avoid memory leaks
    nameController.dispose();
    emailController.dispose();
    websiteController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      key: widget.sectionKey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 150),
          // const Spacer(),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                style: const TextStyle(color: Colors.white),
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                onTapOutside: (f) {
                                  if (FocusScope.of(context).hasPrimaryFocus) {
                                    FocusScope.of(context).unfocus();
                                  } else if (FocusScope.of(context).hasFocus) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(color: Colors.red),
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'Your name',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: emailController,
                                style: const TextStyle(color: Colors.white),
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                onTapOutside: (f) {
                                  if (FocusScope.of(context).hasPrimaryFocus) {
                                    FocusScope.of(context).unfocus();
                                  } else if (FocusScope.of(context).hasFocus) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  // Simple email regex for validation
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(color: Colors.red),
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'Your email',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: websiteController,
                                style: const TextStyle(color: Colors.white),
                                onTapOutside: (f) {
                                  if (FocusScope.of(context).hasPrimaryFocus) {
                                    FocusScope.of(context).unfocus();
                                  } else if (FocusScope.of(context).hasFocus) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white54),
                                  labelText: 'Your websit (if any)',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: messageController,
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                onTapOutside: (f) {
                                  if (FocusScope.of(context).hasPrimaryFocus) {
                                    FocusScope.of(context).unfocus();
                                  } else if (FocusScope.of(context).hasFocus) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(color: Colors.red),
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
                                    onPressed: () {
                                      debugPrint('tapped');
                                      if (_formKey.currentState!.validate()) {
                                        _sendEmail(
                                            nameController.text,
                                            emailController.text,
                                            messageController.text,
                                            websiteController.text,
                                            context);
                                      }
                                    },
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Your name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            labelText: 'Your email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: websiteController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Your websit (if any)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: messageController,
                          style: const TextStyle(color: Colors.white),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'How can I help?*',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('tapped');
                              if (_formKey.currentState!.validate()) {
                                _sendEmail(
                                  nameController.text,
                                  emailController.text,
                                  messageController.text,
                                  websiteController.text,
                                  context,
                                );
                              }
                            },
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
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
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
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'talk  ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
              TextSpan(
                text: "for",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
        Text(
          'Something special',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
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

  void showCustomSnackBarDialog(
      BuildContext context, String message, Color color) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topRight, // Align to top-right corner
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, // Top padding to move it down a bit
                right:
                    20.0), // Right padding to create space from the right edge
            child: Material(
              color: Colors.transparent,
              child: Container(
                // width: 250.0, // Set a fixed width for the snack bar
                padding:
                    const EdgeInsets.all(16.0), // Padding inside the container
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.of(context).pop(); // Dismiss the dialog
      }
    });
  }

  Future<void> _sendEmail(String name, String email, String message,
      String? website, BuildContext context) async {
    const serviceId = 'service_mru4flm';
    const templateId = 'template_ka3m95b';
    const userId = 'W2H8DOgK0CE5q4upO';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name, // Matches {{from_name}} in template
          'from_email': email, // Matches {{from_email}} in template
          'message': message, // Matches {{message}} in template
          'website': website
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully!');
      nameController.clear();
      emailController.clear();
      websiteController.clear();
      messageController.clear();
      showCustomSnackBarDialog(
          context, 'Thanks for leaving a message', Colors.green);
    } else {
      print('Failed to send email: ${response.body}');
      showCustomSnackBarDialog(context, 'Failed to send', Colors.red);
    }
  }
}
