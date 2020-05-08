import 'package:flutter/cupertino.dart';

class LoginUserDataModel {
  final String email;
  final String password;

  LoginUserDataModel({
    @required this.email,
    @required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': this.email, 'password': this.password};
  }
}
