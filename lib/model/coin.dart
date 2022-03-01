class Coin {
  String? name;
  String? symbol;
  double? allTimeLow;
  int? marketCapRank;
  String? imageUrl;
  DateTime? dateTime;

  Coin({
    this.name,
    this.symbol,
    this.allTimeLow,
    this.marketCapRank,
    this.imageUrl,
    this.dateTime,
  });

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['name'],
      symbol: map['symbol'],
      allTimeLow: map['atl'],
      marketCapRank: map['market_cap_rank'],
      imageUrl: map['image'],
      dateTime: DateTime.parse(map['last_updated']),
    );
  }
}
