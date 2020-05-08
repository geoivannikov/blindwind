import 'package:blindwind/service/database/database.dart';
import 'package:flutter/cupertino.dart';

class WalkthroughLocalDataProvider {
  final BlindWindDatabase _database;

  WalkthroughLocalDataProvider({@required BlindWindDatabase database})
      : _database = database;

  Future<void> updateWalkthroughState(Walkthrough seenData) async {
    await _database.walkthroughDao.updateWalkthroughState(seenData);
  }

  Future<Walkthrough> selectWalkthroughState() async {
    return await _database.walkthroughDao.selectWalkthroughState();
  }
}
