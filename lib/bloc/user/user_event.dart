import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent extends PrintableEquatable {
  UserEvent([List props = const <Object>[]]) : super(props);
}

class LoginUser extends UserEvent {
  final String email;
  final String password;
  LoginUser({this.email, this.password}) : super(<Object>[]);
}
