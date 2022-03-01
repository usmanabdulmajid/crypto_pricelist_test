import 'package:bloc/bloc.dart';
import 'package:crypto_pricelist_test/core/exceptions.dart';
import 'package:crypto_pricelist_test/model/coin.dart';
import 'package:crypto_pricelist_test/repository/coin_repository_contract.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final CoinRepositoryConract coinRepository;
  CoinCubit(this.coinRepository) : super(CoinLoading());

  Future<void> loadCoins() async {
    try {
      final result = await coinRepository.coins();
      debugPrint('bankai ${result[0].name}');
      emit(CoinLoaded(result));
    } on InvalidUriFormat {
      debugPrint('Uri format issue');
    } on NetworkException {
      debugPrint('network');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
