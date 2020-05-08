import 'package:blindwind/service/database/database.dart';
import 'package:blindwind/service/repository/user/data_providers/user_global_data_provider.dart';
import 'package:blindwind/service/repository/user/data_providers/user_local_data_provider.dart';
import 'package:blindwind/service/repository/user/user_repository.dart';
import 'package:blindwind/service/repository/walkthrough/data_providers/walkthrough_local_data_provider.dart';
import 'package:blindwind/service/repository/walkthrough/walkthrough_repository.dart';
import 'package:blindwind/service/use_case/user/login_user_use_case.dart';
import 'package:blindwind/service/use_case/user/select_user_use_case.dart';
import 'package:blindwind/service/use_case/walkthrough/is_walkthrough_viewed_state_use_case.dart';
import 'package:blindwind/service/use_case/walkthrough/make_walkthrough_viewed_state_use_case.dart';

enum Flavor { DEBUG, PRODUCTION }

class Injector {
  static final Injector _instance = Injector._private();
  static Flavor _flavor;

  Injector._private();

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _instance;
  }

  BlindWindDatabase get database {
    return BlindWindDatabase();
  }

  UserRepository get userRepository {
    return UserRepository(
        userGlobalDataProvider: _flavor == Flavor.PRODUCTION
            ? ProdUserGlobalDataProvider()
            : MockUserGlobalDataProvider(),
        userLocalDataProvider: UserLocalDataProvider(database: database));
  }

  WalkthroughRepository get walkthroughRepository {
    return WalkthroughRepository(
        walkthroughLocalDataProvider:
            WalkthroughLocalDataProvider(database: database));
  }

  SelectUserUseCase get selectUserUseCase {
    return SelectUserUseCase(userRepository);
  }

  LoginUserUseCase get loginUserUseCase {
    return LoginUserUseCase(userRepository);
  }

  IsWalkthroughViewedUseCase get isWalkthroughViewedUseCase {
    return IsWalkthroughViewedUseCase(walkthroughRepository);
  }

MakeWalkthroughViewedUseCase get makeWalkthroughViewedUseCase {
    return MakeWalkthroughViewedUseCase(walkthroughRepository);
  }

}
