import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';
import '../screen_size.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  final String cardOneDesc = 'This project is an integration of Firebase.Auth, Provider, log_in, onGenerateRoute, and etc.';
  final String cardTwoDesc = 'Firebase, Provider, ListView, ScrollView, PaginatedDataTable,  log_in package, and etc. ';
  final String cardThirdDesc = 'flutter.dev, pub.dev, material.io, firebase.flutter.dev, stackOverFlow, and etc. ';

  final String cardOnePath = 'assets/illustration/Country_side.png';
  final String cardTwoPath = 'assets/illustration/Responsive.png';
  final String cardThirdPath = 'assets/illustration/Spreadsheet.png';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset('assets/illustration/office.jpg')),
              Container(
                alignment: Alignment.center,
                child: Text('Great Flutter World',
                    style: GoogleFonts.dancingScript(
                        color: darkTextColor,
                        fontSize:
                            Theme.of(context).textTheme.headline3?.fontSize)),
              )
            ]),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ImageLeftCard('About', cardOneDesc, cardOnePath),
                  ImageRightCard('Components', cardTwoDesc, cardTwoPath),
                  ImageLeftCard('Resources', cardThirdDesc, cardThirdPath),
                  const SizedBox(
                    height: 50,
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

class ImageLeftCard extends StatelessWidget {
  const ImageLeftCard(this.cardTitle, this.featureDescription, this.imagePath);

  final String cardTitle;
  final String featureDescription;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (!ScreenSize.isSmall(context))? 2.5 / 1 : 1.2/1,
      child: Column(children: [
        Expanded(
          flex: 5,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 16,
            shadowColor: secondaryColor,
            // color: cardColorOne,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: cardColorOne,
                    child: Column(
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              cardTitle,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 3,
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                flex: 24,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    featureDescription,
                                    style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic,),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ]),
    );
  }
}

class ImageRightCard extends StatelessWidget {
  const ImageRightCard(this.cardTitle, this.featureDescription, this.imagePath);

  final String cardTitle;
  final String featureDescription;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (!ScreenSize.isSmall(context))? 2.5 / 1 : 1.2/1,
      child: Column(children: [
        Expanded(
          flex: 5,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 16,
            shadowColor: secondaryColor,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: cardColorOne,
                    child: Column(
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              cardTitle,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 3,
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                flex: 24,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    featureDescription,
                                    style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic,),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ]),
    );
  }
}
