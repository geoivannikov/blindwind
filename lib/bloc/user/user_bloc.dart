import 'package:blindwind/bloc/user/user_event.dart';
import 'package:blindwind/bloc/user/user_state.dart';
import 'package:blindwind/model/data_model/user/LoginUserDataModel.dart';
import 'package:blindwind/service/use_case/user/login_user_use_case.dart';
import 'package:blindwind/service/use_case/user/select_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  LoginUserUseCase _loginUserUseCase;
  SelectUserUseCase _selectUserUseCase;

  @override
  UserState get initialState => InitialUserState();

  UserBloc({
    @required LoginUserUseCase loginUserUseCase,
    @required SelectUserUseCase selectUserUseCase,
  })  : _loginUserUseCase = loginUserUseCase,
        _selectUserUseCase = selectUserUseCase;

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoginUser) {
      yield AuthLoading();
      if (await _loginUserUseCase.createRequest(
          LoginUserDataModel(email: event.email, password: event.password))) {
        yield AuthorizationSuccessState();
      } else {
        yield AuthorizationNotSuccessState();
      }
    }
  }
}
