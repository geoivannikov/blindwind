import 'package:moor_flutter/moor_flutter.dart';

class Walkthroughs extends Table {
  TextColumn get id => text()();
  BoolColumn get hasSeen => boolean()();

  @override
  get primaryKey => { id };
}