import 'dart:io';

import 'package:eloro_shop_uae/core/func/theme_repositores.dart';
import 'package:eloro_shop_uae/core/helpers/cache_helper.dart';
import 'package:eloro_shop_uae/core/helpers/dio_helper.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/view/home/bloc/home_bloc/home_bloc.dart';
import 'package:eloro_shop_uae/view/home/home3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.mainColor,
    statusBarIconBrightness: Brightness.dark, // Set icons to black
    statusBarBrightness: Brightness.light, // Adjust for iOS
  )); // Set the status bar color
  final ThemeRepository themeRepository = ThemeRepository();
  await CacheHelper.init();
  await DioHelper.init();
  // await Hive.initFlutter();
  runApp(MyApp(themeRepository: themeRepository));
}
class MyApp extends StatelessWidget {
  final ThemeRepository themeRepository;
  const MyApp({super.key, required this.themeRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

       providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        // BlocProvider<LocalizationBloc>(create: (context) => LocalizationBloc()),
      ],
      child: MaterialApp(
        title: 'Eloor Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
