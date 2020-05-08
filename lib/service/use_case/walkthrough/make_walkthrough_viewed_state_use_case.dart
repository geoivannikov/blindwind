import 'package:blindwind/service/repository/walkthrough/walkthrough_repository.dart';
import 'package:blindwind/service/use_case/base_use_case.dart';
import 'package:blindwind/service/database/database.dart';

class MakeWalkthroughViewedUseCase
    extends BaseUseCase<WalkthroughRepository, void, void> {
  MakeWalkthroughViewedUseCase(WalkthroughRepository repository) : super(repository);

  @override
  Future<void> createRequest([void arg]) async {
    await repository.updateWalkthroughState(Walkthrough(id: '1', hasSeen: true));
  }
}