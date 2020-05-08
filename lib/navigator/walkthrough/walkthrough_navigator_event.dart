import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class WalkthroughNavigatorEvent extends PrintableEquatable {
  WalkthroughNavigatorEvent([List props = const <Object>[]]) : super(props);
}

class WalkthroughOpen extends WalkthroughNavigatorEvent {}

class WalkthroughNextTapped extends WalkthroughNavigatorEvent {}

class WalkthroughBackTapped extends WalkthroughNavigatorEvent {}
