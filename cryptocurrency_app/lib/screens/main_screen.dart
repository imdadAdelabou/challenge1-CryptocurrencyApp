import 'package:cryptocurrency_app/components/ballance_card.dart';
import 'package:cryptocurrency_app/components/print_datacoin.dart';
import 'package:cryptocurrency_app/screens/take_coins.dart';
import 'package:cryptocurrency_app/utilities/network_helper.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../utilities/constant.dart";

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String chart = "";
  String seeAll = "";
  NetworkHelper networkHelper = NetworkHelper(url: SERVER_IP);
  @override
  void initState() {
    super.initState();
    chart = "Charts";
    seeAll = "See All";
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chart,
                  style: TextStyle(
                    fontFamily: "MontserratR",
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      seeAll,
                      style: TextStyle(
                        color: Color(0xffe58274),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TakeCoins(),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       var response = await networkHelper.getData("/coins/all-data");
            //       print(response);
            //     } catch (e) {
            //       print(e);
            //     }
            //   },
            //   child: Text("Get Button"),
            // ),
          ],
        ),
      ),
    );
  }
}
