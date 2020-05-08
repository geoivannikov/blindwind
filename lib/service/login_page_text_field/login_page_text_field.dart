import 'package:blindwind/constants/color_constants.dart';
import 'package:blindwind/constants/login_page_constants.dart';
import 'package:blindwind/tools/base_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPageTextField extends StatelessWidget {
  TextInputType _textInputType;
  TextEditingController _controller;
  String _labelText;
  Icon _icon;
  bool obscureText;

  LoginPageTextField(
      this._textInputType, this._controller, this._labelText, this._icon,
      this.obscureText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: _textInputType,
      controller: _controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: _labelText,
        icon: Container(
            padding: EdgeInsets.only(
              top: setWidth(LOGIN_PAGE_TEXT_FIELD_SIZE),
            ),
            child: _icon),
      ),
    );
  }
}
