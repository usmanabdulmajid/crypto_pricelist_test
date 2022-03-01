import 'package:crypto_pricelist_test/model/coin.dart';

abstract class CoinRepositoryConract {
  Future<List<Coin>> coins();
}
