class Coin {
  final String id;
  final String symbol;
  final String name;
  final double blockTimeInMinutes;
  final List<String> pathsImage;
  final Map<String, dynamic> marketData;
  Coin({
    required this.id,
    required this.symbol,
    required this.blockTimeInMinutes,
    required this.name,
    required this.marketData,
    required this.pathsImage,
  });

  toModel() {
    return Coin(
      id: id,
      symbol: symbol,
      name: name,
      blockTimeInMinutes: blockTimeInMinutes,
      pathsImage: pathsImage,
      marketData: marketData,
    );
  }
}
