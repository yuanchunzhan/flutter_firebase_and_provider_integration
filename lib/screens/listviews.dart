
import 'package:flutter/material.dart';
import '../constant.dart';

class MyListView extends StatelessWidget {
  MyListView({Key? key}) : super(key: key);

  final List<Color> primaryColors = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.redAccent,
    Colors.amberAccent,
    Colors.greenAccent,
    Colors.blueAccent
  ];

  final List<Color> buildColor = [
    const Color(0xffFF7171),
    const Color(0xffFFC288),
    const Color(0xffCDF0EA),
    const Color(0xffF7DBF0),
    const Color(0xffBEAEE2),
    const Color(0xffBFCBA8),
    const Color(0xff39A2DB),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 1000,
            decoration: BoxDecoration(
              color: darkTextColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: FlatListView(primaryColors)),
                Expanded(child: FlatListView(buildColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlatListView extends StatelessWidget {
  const FlatListView(this.colorName, {Key? key}) : super(key: key);

  final List<Color> colorName;

  List<Widget> generateColorBlock(List<Color> colorName) {
    List<Widget> colorBlockList = [];
    for (var i = 0; i < colorName.length; i++) {
      colorBlockList.add(Container(
        height: 100,
        color: colorName[i].withAlpha(500),
      ));
      colorBlockList.add(const SizedBox(
        height: 10,
      ));
      colorBlockList.add(Container(
        height: 100,
        color: colorName[i].withAlpha(460),
      ));
      colorBlockList.add(const SizedBox(
        height: 10,
      ));
    }
    return colorBlockList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      children: generateColorBlock(colorName),
    );
  }
}
