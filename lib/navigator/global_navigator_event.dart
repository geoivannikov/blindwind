import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class GlobalNavigatorEvent extends PrintableEquatable {
  GlobalNavigatorEvent([List props = const <Object>[]]) : super(props);
}

class AppOpen extends GlobalNavigatorEvent {
  AppOpen() : super(<Object>[]);
}

class WalkthroughFinished extends GlobalNavigatorEvent {
  WalkthroughFinished() : super(<Object>[]);
}

class AuthFinished extends GlobalNavigatorEvent {
  AuthFinished() : super(<Object>[]);
}
