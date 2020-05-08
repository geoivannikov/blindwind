import 'package:equatable/equatable.dart';

abstract class PrintableEquatable extends Equatable {
  PrintableEquatable([List props = const <Object>[]]) : super(props);

  @override
  String toString() {
    return "${this.runtimeType.toString()}" + "${props.isNotEmpty ? "${props.toString()}" : super.toString()}";
  }
}