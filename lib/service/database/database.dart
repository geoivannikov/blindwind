import 'package:blindwind/model/entity/user.dart';
import 'package:blindwind/model/entity/walkthrough.dart';
import 'package:blindwind/service/database/dao/user_dao.dart';
import 'package:blindwind/service/database/dao/walkthrough_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(tables: [Users, Walkthroughs
], daos: [
  UserDao, WalkthroughDao
])

class BlindWindDatabase extends _$BlindWindDatabase {
  BlindWindDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "zoryx_database.sqlite"));

  @override
  int get schemaVersion => 1;
}

