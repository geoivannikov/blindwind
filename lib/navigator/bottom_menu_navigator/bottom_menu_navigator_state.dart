import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BottomMenuNavigatorState extends PrintableEquatable {
  BottomMenuNavigatorState([List props = const <Object>[]]) : super(props);
}

class TasksPageOpen extends BottomMenuNavigatorState {}

class BenefitsPageOpen extends BottomMenuNavigatorState {}

class ProfilePageOpen extends BottomMenuNavigatorState {}

class MenuPageOpen extends BottomMenuNavigatorState {}

class MapPageOpen extends BottomMenuNavigatorState {}
