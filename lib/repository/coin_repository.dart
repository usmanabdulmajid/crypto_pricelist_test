import 'dart:convert';

import 'package:crypto_pricelist_test/core/constants/api_constant.dart';
import 'package:crypto_pricelist_test/core/exceptions.dart';
import 'package:crypto_pricelist_test/model/coin.dart';
import 'package:crypto_pricelist_test/core/api_client.dart';
import 'package:crypto_pricelist_test/repository/coin_repository_contract.dart';

class CoinRepository implements CoinRepositoryConract {
  final ApiClient apiClient;
  CoinRepository(this.apiClient);

  @override
  Future<List<Coin>> coins() async {
    List<Coin> coins = [];
    try {
      final result = await apiClient.request(
          url: ApiConstant.COIN_URL, method: Method.get);
      final decodedResult = jsonDecode(result) as List;
      coins = decodedResult.map((e) => Coin.fromMap(e)).toList();
    } on InvalidUriFormat {
      throw InvalidUriFormat();
    } on NetworkException {
      throw NetworkException();
    } catch (e) {
      throw Exception(e);
    }

    return coins;
  }
}
