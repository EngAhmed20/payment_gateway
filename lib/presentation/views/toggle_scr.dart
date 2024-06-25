import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_gateway/core/utils/app_router.dart';
import 'package:payment_gateway/shared/components/constants.dart';

import '../../generated/assets.dart';
import '../../shared/components/pay_card.dart';

class ToggleScr extends StatelessWidget {
  const ToggleScr({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              payCard(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.KCardScr);
                },
                img: Assets.imagesCard,
                title: 'Pay with Card',
              ),
              payCard(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.KRefCodeScr);

                },
                img: Assets.imagesRef,
                title: 'Pay with Ref Code',
              ),

            ],
          ),
        ),
      )
    );
  }
}

