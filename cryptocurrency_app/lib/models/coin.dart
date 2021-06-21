class Coin {
  final String id;
  final String symbol;
  final String name;
  final double? blockTimeInMinutes;
  final Map<String, dynamic> pathsImage;
  final Map<String, dynamic> marketData;
  final double coinPrice;
  final double priceDevice;
  Coin({
    required this.id,
    required this.symbol,
    this.blockTimeInMinutes,
    required this.name,
    required this.marketData,
    required this.pathsImage,
    required this.coinPrice,
    required this.priceDevice,
  });

  toModel() {
    return Coin(
        id: id,
        symbol: symbol,
        name: name,
        blockTimeInMinutes: blockTimeInMinutes,
        pathsImage: pathsImage,
        marketData: marketData,
        coinPrice: coinPrice,
        priceDevice: priceDevice);
  }
}
