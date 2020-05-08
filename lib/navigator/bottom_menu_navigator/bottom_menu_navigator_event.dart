import 'package:blindwind/other/custom/printable_equitable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BottomMenuNavigatorEvent extends PrintableEquatable {
  BottomMenuNavigatorEvent([List props = const <Object>[]]) : super(props);
}

class TasksItemTapped extends BottomMenuNavigatorEvent {
  TasksItemTapped() : super(<Object>[]);
}

class BenefitItemTapped extends BottomMenuNavigatorEvent {
  BenefitItemTapped() : super(<Object>[]);
}

class MapItemTapped extends BottomMenuNavigatorEvent {
  MapItemTapped() : super(<Object>[]);
}

class ProfileItemTapped extends BottomMenuNavigatorEvent {
  ProfileItemTapped() : super(<Object>[]);
}

class MenuItemTapped extends BottomMenuNavigatorEvent {
  MenuItemTapped() : super(<Object>[]);
}
