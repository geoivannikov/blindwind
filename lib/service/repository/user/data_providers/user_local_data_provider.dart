import 'package:blindwind/service/database/database.dart';
import 'package:flutter/cupertino.dart';

class UserLocalDataProvider {
  final BlindWindDatabase _database;

  UserLocalDataProvider({@required BlindWindDatabase database})
      : _database = database;

  Future<void> saveUser(User user) async {
    await _database.userDao.updateUser(user);
  }

  Future<User> selectCurrentUser() {
    return _database.userDao.selectUser();
  }

  Future<bool> isUserLoggedIn() async {
    final userModel = await selectCurrentUser();
    return userModel != null;
  }
}
