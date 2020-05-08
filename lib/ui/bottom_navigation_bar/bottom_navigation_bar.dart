import 'package:blindwind/constants/base_constants.dart';
import 'package:blindwind/constants/bottom_navigation_bar_constants.dart';
import 'package:blindwind/constants/color_constants.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_bloc.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_event.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_state.dart';
import 'package:blindwind/tools/base_tools.dart';
import 'package:blindwind/ui/bottom_navigation_bar/bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with TickerProviderStateMixin {
  BottomMenuNavigatorBloc _bottomMenuNavigatorBloc;
  @override
  void initState() {
    _bottomMenuNavigatorBloc =
        BlocProvider.of<BottomMenuNavigatorBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bottomMenuNavigatorBloc,
        builder: (BuildContext context, BottomMenuNavigatorState state) {
          return Container(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: setWidth(32),
                top: setWidth(16),
                left: setWidth(16),
                right: setWidth(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  BarItem(
                      icon: FIRST_ICON_DATA,
                      title: FIRST_ICON_TITLE,
                      isActive: state is TasksPageOpen ? true : false,
                      onTap: () =>
                          _bottomMenuNavigatorBloc.dispatch(TasksItemTapped())),
                  AnimatedContainer(
                    height: 0,
                    width:
                        (state is TasksPageOpen || state is BenefitsPageOpen) ? setWidth(10) : setWidth(40),
                    duration: Duration(milliseconds: 300),
                  ),
                  BarItem(
                      icon: SECOND_ICON_DATA,
                      title: SECOND_ICON_TITLE,
                      isActive: state is BenefitsPageOpen ? true : false,
                      onTap: () => _bottomMenuNavigatorBloc
                          .dispatch(BenefitItemTapped())),
                  Spacer(),
                  BarItem(
                      icon: THIRD_ICON_DATA,
                      title: THIRD_ICON_TITLE,
                      isActive: state is ProfilePageOpen ? true : false,
                      onTap: () => _bottomMenuNavigatorBloc
                          .dispatch(ProfileItemTapped())),
                  AnimatedContainer(
                    height: 0,
                    width: (state is ProfilePageOpen || state is MenuPageOpen)
                        ? setWidth(10)
                        : setWidth(40),
                    duration: Duration(milliseconds: 300),
                  ),
                  BarItem(
                      icon: FOURTH_ICON_DATA,
                      title: FOURTH_ICON_TITLE,
                      isActive: state is MenuPageOpen ? true : false,
                      onTap: () =>
                          _bottomMenuNavigatorBloc.dispatch(MenuItemTapped())),
                ],
              ),
            ),
          );
        });
  }
}
