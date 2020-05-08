import 'package:blindwind/model/entity/user.dart';
import 'package:blindwind/service/database/database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'user_dao.g.dart';

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<BlindWindDatabase> with _$UserDaoMixin {
  UserDao(BlindWindDatabase db) : super(db);

  Future<void> insertUser(User user) => into(users).insert(user);

  Future<void> deleteUser() => delete(users).go();

  Future<void> updateUser(User user) {
    return transaction((t) async {
      await deleteUser();
      await insertUser(user);
    });
  }

  Future<User> selectUser() => select(users).getSingle();
}