import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class GlobalNavigatorState extends PrintableEquatable {
  GlobalNavigatorState([List props = const <Object>[]]) : super(props);
}

class LoadingGlobalNavigatorState extends GlobalNavigatorState {}

class WalkthroughHasNotSeen extends GlobalNavigatorState {}

class UserNotAuthed extends GlobalNavigatorState {}

class UserAuthed extends GlobalNavigatorState {}
