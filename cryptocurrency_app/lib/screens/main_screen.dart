import 'dart:convert';

import 'package:cryptocurrency_app/components/ballance_card.dart';
import 'package:cryptocurrency_app/components/print_datacoin.dart';
import 'package:cryptocurrency_app/models/coin.dart';
import 'package:cryptocurrency_app/screens/take_coins.dart';
import 'package:cryptocurrency_app/utilities/network_helper.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../utilities/constant.dart";
import "package:http/http.dart" as http;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String chart = "";
  String seeAll = "";
  int nbMax = 11;
  NetworkHelper networkHelper = NetworkHelper(url: SERVER_IP);
  late Future<dynamic> dataCoin;

  @override
  void initState() {
    super.initState();
    chart = "Charts";
    seeAll = "See All";
    dataCoin = getData();
  }

  Future<dynamic> getData() async {
    try {
      var response = await networkHelper.getData("/coins/all-data");
      if (response != null) {
        return response["body"];
      }
    } catch (e) {
      print(e);
      return;
    }
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
            Expanded(
              child: FutureBuilder(
                  future: dataCoin,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.hasError}");
                      } else if (snapshot.hasData) {
                        List<dynamic> data = snapshot.data as List<dynamic>;

                        return ListView.builder(
                          itemCount: nbMax,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> market_data =
                                data[index]["market_data"];
                            print(data[2]);
                            return Column(
                              children: [
                                TakeCoins(
                                  coin: Coin(
                                    id: data[index]["id"],
                                    symbol: data[index]["symbol"],
                                    name: data[index]["name"],
                                    blockTimeInMinutes: data[index]
                                                ["block_time_in_minutes"] !=
                                            null
                                        ? double.parse(data[index]
                                            ["block_time_in_minutes"])
                                        : 0.0,
                                    pathsImage: data[index]["image"],
                                    coinPrice: double.parse(
                                        market_data["current_price"]["btc"]
                                            .toString()),
                                    marketData: data[index]["market_data"],
                                    priceDevice: double.parse(
                                      market_data["current_price"]["usd"]
                                          .toString(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Visibility(
                                  visible: !(index == 10), //&& index != 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Divider(
                                      thickness: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                    return Text("Waiting");
                  }),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "Accueil",
            icon: Icon(FontAwesomeIcons.bars),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: Icon(FontAwesomeIcons.syncAlt),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: Icon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }
}
