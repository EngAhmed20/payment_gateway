import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/final_token.dart';
import '../../../models/first_token.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/dio.dart';
part 'payment_state.dart';
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context)=> BlocProvider.of(context);
  Future getFirstToken(String price,String firstName,
      String lastName,String email,String phone)async{
    emit(PaymentAuthLoading());
   await DioHelperPayment.postData(url: 'auth/tokens',data: {'api_key':paymobApiKey},).then((value){
      paymobFirstToken = value.data['token'];
      print('first token: ${paymobFirstToken}:');
      getOrderId(price,firstName,lastName,email,phone);
      getFinalTokenKiosk(price,firstName,lastName,email,phone);
      emit(PaymentAuthSucess());
    }).catchError((error){
      print(error.toString());
      emit(PaymentAuthError(error.toString()));
    });

  }
  Future getOrderId(String price,String firstName,
  String lastName,String email,String phone)async{
    emit(PaymentOrderIDLoading());
    await DioHelperPayment.postData(url: 'ecommerce/orders', data:{
      'auth_token':paymobFirstToken,'amount_cents':price,"currency": "EGP",
      'items':[],"delivery_needed": "false",}).then((value){
      OrderId=value.data['id'].toString();
      print('order id: ${OrderId}:');
      getFinalTokenCard(price,firstName,lastName,email,phone);
      emit(PaymentOrderIDSucess());
    }).catchError((error){
      print('this err ${error.toString()}');
      emit(PaymentOrderIDError(error.toString()));
    });

  }
  Future getFinalTokenCard(String price,String firstName,
      String lastName,String email,String phone)async{
    emit(PaymentFinalTokenLoading());
    await DioHelperPayment.postData(url: 'acceptance/payment_keys', data:{
        "auth_token": paymobFirstToken,
        "amount_cents": price,
        "expiration": 3600,
        "billing_data": {
          "apartment": "803",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
              "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "Egypt",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": IntegrationIDCard,
        "lock_order_when_paid": "false",
      }
    ).then((value){
      //FinalTokenCard=value.data['token'];
      FinalToken finalToken=FinalToken.fromJson(value.data);
      FinalTokenCard=finalToken.token;
      emit(PaymentFinalTokenSucess());
      print('final token card: ${finalToken.token}');
    }).catchError((error){
      print('this getFinalTokenCard err ${error.toString()}');
      emit(PaymentFinalTokenError(error.toString()));
    });

  }
  Future getFinalTokenKiosk(String price,String firstName,
      String lastName,String email,String phone)async{
    emit(PaymentKioskLoading());
    await DioHelperPayment.postData(url: 'acceptance/payment_keys', data:{
      "auth_token": paymobFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "billing_data": {
        "apartment": "803",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "Egypt",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id":IntegrationIDKiosk ,
      "lock_order_when_paid": "false",
    }
    ).then((value){
      FinalTokenKiosk=value.data['token'];
      print('final token kiosk: ${FinalTokenKiosk}:');
      refCode();
      emit(PaymentKioskSucess());
    }).catchError((error){
      print('this getFinalTokenKiosk err ${error.toString()}');
      emit(PaymentKioskError(error.toString()));
    });

  }

  Future refCode()async{
    emit(PaymentRefCodeLoading());
    await DioHelperPayment.postData(url: 'acceptance/payments/pay', data:{
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR"
      },
      "payment_token": FinalTokenKiosk,
    }
    ).then((value){
      RefCode=value.data['id'].toString();
      print('Ref Code: ${RefCode}:');
      emit(PaymentRefCodeSucess());
    }).catchError((error){
      print('this getFinalTokenKiosk err ${error.toString()}');
      emit(PaymentRefCodeError(error.toString()));
    });

  }

}
