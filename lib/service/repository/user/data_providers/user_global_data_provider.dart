import 'package:blindwind/model/data_model/user/LoginUserDataModel.dart';
import 'package:blindwind/service/database/database.dart';

abstract class UserGlobalDataProvider {
  Future<User> loginUser(LoginUserDataModel loginUserDataModel);
}

class ProdUserGlobalDataProvider extends UserGlobalDataProvider {
  @override
  Future<User> loginUser(LoginUserDataModel loginUserDataModel) {
    return null;
  }
}

class MockUserGlobalDataProvider extends UserGlobalDataProvider {
  @override
  Future<User> loginUser(LoginUserDataModel loginUserDataModel) async{
    await Future<void>.delayed(Duration(seconds: 1));
    return User(accessToken: 'supernavorochenytoken', fullName: 'Georgiy Ivannikov', id: '696969', mail: 'george@fit.cvut.cz'
    );
  }
}
