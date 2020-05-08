import 'package:blindwind/service/repository/walkthrough/walkthrough_repository.dart';
import 'package:blindwind/service/use_case/base_use_case.dart';

class IsWalkthroughViewedUseCase extends BaseUseCase<WalkthroughRepository, void, bool> {
  IsWalkthroughViewedUseCase(WalkthroughRepository repository) : super(repository);

  @override
  Future<bool> createRequest([void arg]) async {
    final walkthrough = await repository.selectWalkthroughState();
    if (walkthrough == null) {
      return false;
    }
    return walkthrough.hasSeen;
  }
}