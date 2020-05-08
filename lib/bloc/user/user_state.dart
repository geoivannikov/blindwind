import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserState extends PrintableEquatable {
  UserState([List props = const <Object>[]]) : super(props);
}

class InitialUserState extends UserState {}

class AuthorizationSuccessState extends UserState {}

class AuthorizationNotSuccessState extends UserState {}

class AuthLoading extends UserState {}
