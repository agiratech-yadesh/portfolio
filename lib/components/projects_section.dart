import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.sectionKey});
  final GlobalKey sectionKey;

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
      key: sectionKey,
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding2),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'My ',
                style: TextStyle(
                    fontSize: screenWidth > 600 ? 50 : 30,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Projects',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: screenWidth > 600 ? 50 : 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            // first project

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(child: Text('image')),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //count

                        Text(
                          '01',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //title

                        Text(
                          'To-Do, Note App',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          width: 500,
                          height: 200,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra, nunc in volutpat scelerisque, justo est aliquam nisi, eget dictum justo odio at lectus. Curabitur et libero nisi. Aliquam erat volutpat. Ut lobortis turpis nec mauris gravida, id porttitor magna efficitur. Etiam dapibus efficitur enim.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // second project

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //count

                        Text(
                          '01',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //title

                        Text(
                          'To-Do, Note App',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          width: 500,
                          height: 200,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra, nunc in volutpat scelerisque, justo est aliquam nisi, eget dictum justo odio at lectus. Curabitur et libero nisi. Aliquam erat volutpat. Ut lobortis turpis nec mauris gravida, id porttitor magna efficitur. Etiam dapibus efficitur enim.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(child: Text('image')),
                    ),
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
