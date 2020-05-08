import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class WalkthroughNavigatorState extends PrintableEquatable {
  WalkthroughNavigatorState([List props = const <Object>[]]) : super(props);
}

class InitialWalkthroughNavigatorState extends WalkthroughNavigatorState {}

class WalkthroughPageChangedOpen extends WalkthroughNavigatorState {}

class WalkthroughFirstPageOpen extends WalkthroughNavigatorState {}

class WalkthroughPageOpen extends WalkthroughNavigatorState {
  final int pageNumber;
  WalkthroughPageOpen({this.pageNumber});
}

class WalkthroughLastPageOpen extends WalkthroughNavigatorState {}
