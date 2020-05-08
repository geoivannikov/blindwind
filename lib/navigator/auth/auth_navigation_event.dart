import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginPageNavigatorEvent extends PrintableEquatable {
  LoginPageNavigatorEvent([List props = const <Object>[]]) : super(props);
}

class GoToSignInTapped extends LoginPageNavigatorEvent {} 

class ValidationIsPassed extends LoginPageNavigatorEvent {} 

class ValidationIsNotPassed extends LoginPageNavigatorEvent {
  final String error;
  ValidationIsNotPassed({this.error});
} 

class GoToSignUpTapped extends LoginPageNavigatorEvent {}

class SignUpTapped extends LoginPageNavigatorEvent {}

class SignInTapped extends LoginPageNavigatorEvent {}

class ForgotPasswordTapped extends LoginPageNavigatorEvent {}