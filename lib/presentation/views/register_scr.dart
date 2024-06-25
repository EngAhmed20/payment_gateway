import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_gateway/core/utils/app_router.dart';
import 'package:payment_gateway/presentation/controller/cubit/payment_cubit.dart';
import 'package:payment_gateway/shared/components/constants.dart';

import '../../shared/components/custom_button.dart';
import '../../shared/components/custom_text_form.dart';

class RegisterScr extends StatefulWidget {
  RegisterScr({Key? key}) : super(key: key);

  @override
  State<RegisterScr> createState() => _RegisterScrState();
}

class _RegisterScrState extends State<RegisterScr> {
  TextEditingController _firstnameController = TextEditingController();

  TextEditingController _lastnameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  final GlobalKey<FormState> form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit,PaymentState>(
        builder: (context,state){
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(appName),
              centerTitle: true,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Form(
                    key: form_key,
                    child: Column(
                      children: [
                        defaulttextform(
                          controller: _firstnameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'This Filed Can\'t be null';
                            }
                            return null;
                          },
                          hint: 'First Name',
                          preficon: Icons.person,
                        ),
                        mySizedBox(height: 25),
                        defaulttextform(
                          controller: _lastnameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'This Filed Can\'t be null';
                            }
                            return null;
                          },
                          hint: 'Last Name',
                          preficon: Icons.person,
                        ),
                        mySizedBox(height: 25),
                        defaulttextform(
                          controller: _emailController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'This Filed Can\'t be null';
                            }
                            return null;
                          },
                          hint: 'Email',
                          preficon: Icons.email,
                        ),
                        mySizedBox(height: 25),
                        defaulttextform(
                          controller: _phoneController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'This Filed Can\'t be null';
                            }
                            return null;
                          },
                          hint: 'phone',
                          preficon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        mySizedBox(height: 25),
                        defaulttextform(
                          controller: _priceController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'This Filed Can\'t be null';
                            }
                            return null;
                          },
                          hint: 'Price',
                          preficon: Icons.monetization_on,
                          keyboardType: TextInputType.number,
                        ),
                        mySizedBox(height: 25),
                        customButton(
                          text: 'Go To Pay',
                          isLoading: state is PaymentAuthLoading|| state is PaymentOrderIDLoading||state is PaymentKioskLoading ||state is PaymentRefCodeLoading ,
                          onTap: () async {

                            if (form_key.currentState!.validate()) {
                              PaymentCubit.get(context).getFirstToken(
                                  _priceController.text,
                                  _firstnameController.text,
                                  _lastnameController.text,
                                  _emailController.text,
                                  _phoneController.text);
                              //clearTextForm();

                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context,state){
          if (state is PaymentRefCodeSucess) {
            GoRouter.of(context).pushReplacement(AppRouter.KToggleView);
          }
        },
      ),
    );
  }
  void clearTextForm(){
    _phoneController.clear();
    _firstnameController.clear();
    _lastnameController.clear();
    _emailController.clear();
    _priceController.clear();
  }
}
