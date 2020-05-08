import 'package:moor_flutter/moor_flutter.dart';

class Users extends Table {
  TextColumn get id => text()();

  @JsonKey("mail")
  TextColumn get mail => text().named("mail")();

  @JsonKey("full_name")
  TextColumn get fullName => text().named("full_name")();

  @JsonKey("access_token")
  TextColumn get accessToken => text().named("access_token")();

  @override
  get primaryKey => {id};
}
