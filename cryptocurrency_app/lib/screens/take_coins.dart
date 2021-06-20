import 'package:cryptocurrency_app/components/print_datacoin.dart';
import "package:flutter/material.dart";

class TakeCoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrintDataCoin(
      containerColor: Color(0xfffef0ee),
      symbolCoin: "BTC",
      coinPriceDevice: 49000.0,
      coinPrice: 1.73,
      lineColor: Colors.orange,
    );
  }
}
