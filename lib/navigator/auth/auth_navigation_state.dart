import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginPageNavigatorState extends PrintableEquatable {
  LoginPageNavigatorState([List props = const <Object>[]]) : super(props);
}

class InitialLoginPageNavigatorState extends LoginPageNavigatorState {}

class SignInPageOpen extends LoginPageNavigatorState {}

class SignUpPageOpen extends LoginPageNavigatorState {}

class ForgotPasswordPageOpen extends LoginPageNavigatorState {}

class CheckValidation extends LoginPageNavigatorState {}

class NewError extends LoginPageNavigatorState {}

class ShowError extends LoginPageNavigatorState {
  final String error;
  ShowError({this.error});
}

class TryToLoginIn extends LoginPageNavigatorState {}
