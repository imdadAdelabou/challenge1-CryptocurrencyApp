import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrintDataCoin extends StatefulWidget {
  final Color containerColor;
  final String symbolCoin;
  final double coinPriceDevice;
  final double coinPrice;
  final Color lineColor;
  final String pathsImg;
  PrintDataCoin({
    required this.containerColor,
    required this.symbolCoin,
    required this.coinPriceDevice,
    required this.coinPrice,
    required this.lineColor,
    required this.pathsImg,
  });

  @override
  _PrintDataCoinState createState() => _PrintDataCoinState();
}

class _PrintDataCoinState extends State<PrintDataCoin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: widget.containerColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              // child: CachedNetworkImage(
              //   imageUrl:
              //       "https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png",
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
            ),
            SizedBox(width: 15.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    widget.symbolCoin.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Text(
                  "+1,6%",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 10.0, right: 10.0),
              child: Container(
                width: 120.0,
                height: 40.0,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    minX: 0,
                    maxX: 10,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        colors: [widget.lineColor],
                        isCurved: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [
                            widget.lineColor.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 17,
                      ),
                      Text(
                        widget.coinPriceDevice.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.coinPrice.toString()} ${widget.symbolCoin.toUpperCase()}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
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
