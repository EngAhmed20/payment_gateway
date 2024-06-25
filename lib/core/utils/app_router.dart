
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_gateway/presentation/views/register_scr.dart';
import 'package:payment_gateway/presentation/views/toggle_scr.dart';
import 'package:payment_gateway/presentation/views/widgets/card_scr.dart';
import 'package:payment_gateway/presentation/views/widgets/ref_code_scr.dart';
import 'package:payment_gateway/shared/components/constants.dart';
abstract class AppRouter{
  static const KToggleView='/toggleView';
  static const KCardScr='/cardScr';
  static const KRefCodeScr='/refCodeView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  RegisterScr();
        },


      ),
      GoRoute(
        path: KToggleView,
        builder: (BuildContext context, GoRouterState state) {
          return  ToggleScr();
        },


      ),
      GoRoute(
        path: KCardScr,
        builder: (BuildContext context, GoRouterState state) {
          return  CardScr();
        },


      ),
      GoRoute(
        path: KRefCodeScr,
        builder: (BuildContext context, GoRouterState state) {
          return  RefCodeScr();
        },


      ),


    ],
  );
}
