import 'package:blindwind/model/data_model/user/LoginUserDataModel.dart';
import 'package:blindwind/service/database/database.dart';
import 'package:flutter/cupertino.dart';

import 'data_providers/user_global_data_provider.dart';
import 'data_providers/user_local_data_provider.dart';

class UserRepository {
  UserLocalDataProvider _userLocalDataProvider;
  UserGlobalDataProvider _userGlobalDataProvider;

  UserRepository({
    @required UserGlobalDataProvider userGlobalDataProvider,
    @required UserLocalDataProvider userLocalDataProvider,
  })  : _userGlobalDataProvider = userGlobalDataProvider,
        _userLocalDataProvider = userLocalDataProvider;

  Future<User> loginUser(LoginUserDataModel loginUserDataModel) {
    return _userGlobalDataProvider.loginUser(loginUserDataModel);
  }

  Future<void> saveUser(User user) {
    return _userLocalDataProvider.saveUser(user);
  }

  Future<User> selectCurrentUser() {
    return _userLocalDataProvider.selectCurrentUser();
  }

  Future<bool> isUserLoggedIn() {
    return _userLocalDataProvider.isUserLoggedIn();
  }
}
