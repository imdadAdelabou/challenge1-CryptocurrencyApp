import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';

class PrintDataCoin extends StatefulWidget {
  final Color containerColor;
  final String symbolCoin;
  final double coinPriceDevice;
  final double coinPrice;
  PrintDataCoin({
    required this.containerColor,
    required this.symbolCoin,
    required this.coinPriceDevice,
    required this.coinPrice,
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
                color: Colors.red,
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
                    widget.symbolCoin,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.coinPriceDevice.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "${widget.coinPrice.toString()} ${widget.symbolCoin}",
                    style: TextStyle(
                      color: Colors.grey,
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
