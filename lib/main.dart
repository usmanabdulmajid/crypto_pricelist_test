import 'package:crypto_pricelist_test/core/api_client.dart';
import 'package:crypto_pricelist_test/core/constants/app_color.dart';
import 'package:crypto_pricelist_test/cubit/coin_cubit.dart';
import 'package:crypto_pricelist_test/repository/coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinCubit>(
      create: (context) => CoinCubit(CoinRepository(ApiClient(Client()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto pricelist test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            child: child!,
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: AppColor.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );
        },
        home: const HomeScreen(),
      ),
    );
  }
}
