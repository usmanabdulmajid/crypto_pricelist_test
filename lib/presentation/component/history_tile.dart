import 'package:crypto_pricelist_test/core/constants/app_color.dart';
import 'package:crypto_pricelist_test/core/utils/extensions.dart';
import 'package:crypto_pricelist_test/core/utils/gaps.dart';
import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  final String? coinName;
  final String? symbol;
  final double? alt;
  final int? marketCapRank;
  final String? imageUrl;
  final DateTime? date;
  const HistoryTile(
      {this.coinName,
      this.symbol,
      this.alt,
      this.marketCapRank,
      this.imageUrl,
      this.date,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth(0.23),
            height: context.screenHeight(0.15),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Image.network(imageUrl!),
          ),
          const XGap(10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              height: context.screenHeight(0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    symbol!,
                    style: const TextStyle(
                        color: AppColor.grey, fontWeight: FontWeight.bold),
                  ),
                  const YGap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${marketCapRank!.toString()} $coinName!',
                          style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const XGap(10),
                      Text(
                        '\$${alt!.toStringAsFixed(4).toString()}',
                        style: const TextStyle(
                          color: AppColor.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const YGap(10),
                  Text(
                    date!.toTimeMonthDayYear(),
                    style: const TextStyle(
                        color: AppColor.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
