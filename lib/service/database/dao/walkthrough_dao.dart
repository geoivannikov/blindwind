import 'package:blindwind/service/database/database.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:blindwind/model/entity/walkthrough.dart';

part 'walkthrough_dao.g.dart';

@UseDao(tables: [Walkthroughs])
class WalkthroughDao extends DatabaseAccessor<BlindWindDatabase> with _$WalkthroughDaoMixin {
  WalkthroughDao(BlindWindDatabase db) : super(db);

  Future<void> insertWalkthroughState(Walkthrough walkthrough) => into(walkthroughs).insert(walkthrough);

  Future<void> deleteWalkthroughState() => delete(walkthroughs).go();

  Future<void> updateWalkthroughState(Walkthrough walkthrough) {
    return transaction((t) async {
      await deleteWalkthroughState();
      await insertWalkthroughState(walkthrough);
    });
  }

  Future<Walkthrough> selectWalkthroughState() => select(walkthroughs).getSingle();
}
