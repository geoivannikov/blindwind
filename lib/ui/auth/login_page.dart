import 'package:blindwind/bloc/user/user_bloc.dart';
import 'package:blindwind/bloc/user/user_event.dart';
import 'package:blindwind/bloc/user/user_state.dart';
import 'package:blindwind/constants/base_constants.dart';
import 'package:blindwind/constants/login_page_constants.dart';
import 'package:blindwind/navigator/auth/auth_navigation_bloc.dart';
import 'package:blindwind/navigator/auth/auth_navigation_event.dart';
import 'package:blindwind/navigator/auth/auth_navigation_state.dart';
import 'package:blindwind/navigator/global_navigator_bloc.dart';
import 'package:blindwind/navigator/global_navigator_event.dart';
import 'package:blindwind/service/login_page_text_field/login_page_text_field.dart';
import 'package:blindwind/tools/base_tools.dart';
import 'package:blindwind/ui/ui_tools/background_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _textEditingEmailController;
  TextEditingController _textEditingPasswordController;
  LoginPageNavigationBlock _loginPageNavigationBlock;
  GlobalNavigatorBloc _globalNavigatorBloc;
  UserBloc _userBloc;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  RegExp _expEmail;
  RegExp _expPassword;

  @override
  void initState() {
    _textEditingEmailController = TextEditingController();
    _textEditingPasswordController = TextEditingController();
    _loginPageNavigationBlock = LoginPageNavigationBlock();
    _globalNavigatorBloc = BlocProvider.of<GlobalNavigatorBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _expEmail = RegExp(REGULAR_EMAIL_EXPRESSION);
    _expPassword = RegExp(REGULAR_PASSWORD_EXPRESSION);
    super.initState();
  }

  void _showError(BuildContext context, String error) {
    WidgetsBinding.instance.scheduleFrameCallback(
      (context) => _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            error,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingPasswordController.dispose();
    _textEditingEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext widgetContext) {
    return BlocBuilder(
      bloc: _userBloc,
      builder: (BuildContext context, UserState userState) {
        return MultiBlocListener(
          listeners: [
            BlocListener<LoginPageNavigationBlock, LoginPageNavigatorState>(
              bloc: _loginPageNavigationBlock,
              listener:
                  (BuildContext context, LoginPageNavigatorState authListener) {
                if (authListener is CheckValidation) {
                  if (_textEditingEmailController.text == null ||
                      _textEditingEmailController.text == '' ||
                      _textEditingPasswordController.text == null ||
                      _textEditingPasswordController.text == '') {
                    _loginPageNavigationBlock.dispatch(
                        ValidationIsNotPassed(error: FILL_FIELDS_ERROR));
                  } else if (_textEditingPasswordController.text.length < 8 || _textEditingPasswordController.text.length > 50) {
                    _loginPageNavigationBlock.dispatch(
                        ValidationIsNotPassed(error: PASSWORD_LENGTH_ERROR));
                  } else if (!_expPassword.hasMatch(_textEditingPasswordController.text)) {
                    _loginPageNavigationBlock.dispatch(
                        ValidationIsNotPassed(error: PASSWORD_INCORRECT_FORMAT_ERROR));
                  } else if (!_expEmail.hasMatch(_textEditingEmailController.text)) {
                    _loginPageNavigationBlock.dispatch(ValidationIsNotPassed(
                        error: EMAIL_INCORRECT_FORMAT_ERROR));
                  } else {
                    _loginPageNavigationBlock.dispatch(ValidationIsPassed());
                  }
                } else if (authListener is TryToLoginIn) {
                  _userBloc.dispatch(LoginUser());
                } else if (authListener is ShowError) {
                  _showError(context, authListener.error);
                }
              },
            ),
            BlocListener<UserBloc, UserState>(
              bloc: _userBloc,
              listener: (BuildContext context, UserState userState) {
                if (userState is AuthorizationSuccessState) {
                  _globalNavigatorBloc.dispatch(AuthFinished());
                }
              },
            ),
          ],
          child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomPadding: true,
            body: Builder(
              builder: (context) =>
                SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      child: CustomPaint(
                        painter: BackgroundPainter(),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.11,
                                right: MediaQuery.of(context).size.width * 0.11,
                                top: MediaQuery.of(context).size.height * 0.52,
                              ),
                              child: LoginPageTextField(
                                  TextInputType.emailAddress,
                                  _textEditingEmailController,
                                  EMAIL_LABEL_TEXT,
                                  Icon(Icons.email),
                                  false),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.11,
                              ),
                              child: LoginPageTextField(
                                  TextInputType.text,
                                  _textEditingPasswordController,
                                  PASSWORD_LABEL_TEXT,
                                  Icon(Icons.lock),
                                  true),
                            ),
                            Center(
                              child: userState is AuthLoading
                                  ? CircularProgressIndicator()
                                  : GestureDetector(
                                      child: Text(
                                        SIGN_IN_TEXT,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              setSp(BASE_FONT_HEADER_SIZE),
                                        ),
                                      ),
                                      onTap: () {
                                        _loginPageNavigationBlock
                                            .dispatch(SignInTapped());
                                      },
                                    ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.13,
                                top: MediaQuery.of(context).size.width * 0.15,
                              ),
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Text(
                                      FORGOT_PASSWORD_TEXT,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: setSp(BASE_FONT_TEXT_SIZE),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () {
                                      _loginPageNavigationBlock
                                          .dispatch(ForgotPasswordTapped());
                                    },
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.35,
                                    ),
                                    child: GestureDetector(
                                      child: Text(
                                        SIGN_UP_TEXT,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: setSp(BASE_FONT_TEXT_SIZE),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ),
          ),
        );
      },
    );
  }
}
