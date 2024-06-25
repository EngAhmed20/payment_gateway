import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/app_router.dart';
import 'package:payment_gateway/presentation/views/register_scr.dart';
import 'package:payment_gateway/shared/network/dio.dart';

import 'bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  Bloc.observer= NoteBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

