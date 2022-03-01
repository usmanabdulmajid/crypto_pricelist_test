part of 'coin_cubit.dart';

@immutable
abstract class CoinState extends Equatable {}

class CoinLoading extends CoinState {
  @override
  List<Object?> get props => [];
}

class CoinLoaded extends CoinState {
  final List<Coin> coins;
  CoinLoaded(this.coins);

  @override
  List<Object?> get props => [coins];
}
