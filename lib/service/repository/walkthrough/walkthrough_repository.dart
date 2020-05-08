import 'package:blindwind/service/database/database.dart';
import 'package:blindwind/service/repository/walkthrough/data_providers/walkthrough_local_data_provider.dart';
import 'package:flutter/cupertino.dart';

class WalkthroughRepository {
  WalkthroughLocalDataProvider _walkthroughLocalDataProvider;

  WalkthroughRepository({
    @required WalkthroughLocalDataProvider walkthroughLocalDataProvider,
  })  : _walkthroughLocalDataProvider = walkthroughLocalDataProvider;

  Future<void> updateWalkthroughState(Walkthrough walkthroughtHasSeenData) async {
    return await _walkthroughLocalDataProvider.updateWalkthroughState(walkthroughtHasSeenData);
  }

  Future<Walkthrough> selectWalkthroughState() async {
    return await _walkthroughLocalDataProvider.selectWalkthroughState();
  }
}
