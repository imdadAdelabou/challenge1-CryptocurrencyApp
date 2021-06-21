import 'package:cryptocurrency_app/components/print_datacoin.dart';
import 'package:cryptocurrency_app/models/coin.dart';
import "package:flutter/material.dart";

class TakeCoins extends StatelessWidget {
  final Coin coin;
  TakeCoins({required this.coin});
  @override
  Widget build(BuildContext context) {
    return PrintDataCoin(
      containerColor: Color(0xfffef0ee),
      symbolCoin: coin.symbol,
      coinPriceDevice: coin.priceDevice,
      coinPrice: coin.coinPrice,
      lineColor: Colors.orange,
      pathsImg: coin.pathsImage["small"],
    );
  }
}
