import 'package:cryptocurrency_app/components/print_datacoin.dart';
import "package:flutter/material.dart";

class TakeCoins extends StatefulWidget {
  TakeCoins();

  @override
  _TakeCoinsState createState() => _TakeCoinsState();
}

class _TakeCoinsState extends State<TakeCoins> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrintDataCoin(
          containerColor: Color(0xfffef0ee),
          symbolCoin: "BTC",
          coinPriceDevice: 49000.0,
          coinPrice: 1.73,
        ),
      ],
    );
  }
}
