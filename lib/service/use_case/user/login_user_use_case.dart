import 'package:blindwind/model/data_model/user/LoginUserDataModel.dart';
import 'package:blindwind/service/repository/user/user_repository.dart';
import 'package:blindwind/service/use_case/base_use_case.dart';

class LoginUserUseCase
    extends BaseUseCase<UserRepository, LoginUserDataModel, bool> {
  LoginUserUseCase(UserRepository repository) : super(repository);

  @override
  Future<bool> createRequest([LoginUserDataModel arg]) async {
    final user = await repository.loginUser(arg);
    if (user != null) {
      await repository.saveUser(user);
    }
    return user != null;
  }
}
