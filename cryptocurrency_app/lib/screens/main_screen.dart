import 'package:cryptocurrency_app/components/ballance_card.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../utilities/constant.dart";

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          children: [
            SizedBox(height: maxHeight * .1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Portfolio",
                  style: TextStyle(
                    fontSize: maxWidth * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    onTap: () {
                      print("settings");
                    },
                    child: Icon(
                      FontAwesomeIcons.cog,
                      color: Color(0xffbdc3d6),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            BallanceCard(
              iconDevice: FontAwesomeIcons.dollarSign,
              totalBalance: "49,329.77",
              colorsGradient: device["dollar"],
            ),
          ],
        ),
      ),
    );
  }
}
