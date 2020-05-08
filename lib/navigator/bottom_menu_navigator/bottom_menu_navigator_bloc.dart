import 'package:bloc/bloc.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_event.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_state.dart';

class BottomMenuNavigatorBloc
    extends Bloc<BottomMenuNavigatorEvent, BottomMenuNavigatorState> {
  @override
  BottomMenuNavigatorState get initialState => TasksPageOpen();

  @override
  Stream<BottomMenuNavigatorState> mapEventToState(
      BottomMenuNavigatorEvent event) async* {
    if (event is TasksItemTapped) {
      yield TasksPageOpen();
    }
    if (event is BenefitItemTapped) {
      yield BenefitsPageOpen();
    }
    if (event is ProfileItemTapped) {
      yield ProfilePageOpen();
    }
    if (event is MapItemTapped) {
      yield MapPageOpen();
    }
    if (event is MenuItemTapped) {
      yield MenuPageOpen();
    }
  }
}
