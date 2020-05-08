import 'package:blindwind/service/database/database.dart';
import 'package:blindwind/service/repository/user/user_repository.dart';
import 'package:blindwind/service/use_case/base_use_case.dart';

class SelectUserUseCase extends BaseUseCase<UserRepository, void, User> {
  SelectUserUseCase(UserRepository repository) : super(repository);

  @override
  Future<User> createRequest([void arg]) async {
    final user = await repository.selectCurrentUser();
    return user;
  }
}