import 'package:crypto_pricelist_test/core/constants/app_color.dart';
import 'package:crypto_pricelist_test/core/utils/gaps.dart';
import 'package:crypto_pricelist_test/cubit/coin_cubit.dart';
import 'package:crypto_pricelist_test/model/coin.dart';
import 'package:crypto_pricelist_test/presentation/component/history_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/src/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoinCubit>().loadCoins();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinCubit, CoinState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.background,
          body: Padding(
            padding: const EdgeInsets.only(top: 70, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'History',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    Row(
                      children: const [
                        RotatedBox(
                            quarterTurns: 3,
                            child: Icon(CupertinoIcons.slider_horizontal_3)),
                        Text(
                          'Sort/Filter',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black),
                        ),
                      ],
                    )
                  ],
                ),
                if (state is CoinLoading)
                  const Expanded(
                      child: Center(
                          child: SpinKitFadingCube(
                    color: AppColor.red,
                  ))),
                if (state is CoinLoaded)
                  Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            List<Coin> coins = state.coins;
                            return HistoryTile(
                              coinName: coins[index].name,
                              symbol: coins[index].symbol,
                              alt: coins[index].allTimeLow,
                              marketCapRank: coins[index].marketCapRank,
                              imageUrl: coins[index].imageUrl,
                              date: coins[index].dateTime,
                            );
                          }))
              ],
            ),
          ),
        );
      },
    );
  }
}
