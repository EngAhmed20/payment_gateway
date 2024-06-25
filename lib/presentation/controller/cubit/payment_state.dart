part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentAuthLoading extends PaymentState {}
class PaymentAuthSucess extends PaymentState {}
class PaymentAuthError extends PaymentState {
  final String errorMessage;
  PaymentAuthError(this.errorMessage);
}
/////////////////////////
class PaymentOrderIDLoading extends PaymentState {}
class PaymentOrderIDSucess extends PaymentState {}
class PaymentOrderIDError extends PaymentState {
  final String errorMessage;
  PaymentOrderIDError(this.errorMessage);
}

class PaymentFinalTokenLoading extends PaymentState {}
class PaymentFinalTokenSucess extends PaymentState {}
class PaymentFinalTokenError extends PaymentState {
  final String errorMessage;
  PaymentFinalTokenError(this.errorMessage);
}

class PaymentKioskLoading extends PaymentState {}
class PaymentKioskSucess extends PaymentState {}
class PaymentKioskError extends PaymentState {
  final String errorMessage;
  PaymentKioskError(this.errorMessage);
}

class PaymentRefCodeLoading extends PaymentState {}
class PaymentRefCodeSucess extends PaymentState {}
class PaymentRefCodeError extends PaymentState {
  final String errorMessage;
  PaymentRefCodeError(this.errorMessage);
}

