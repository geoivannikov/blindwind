import 'package:blindwind/constants/base_constants.dart';
import 'package:blindwind/constants/bottom_navigation_bar_constants.dart';
import 'package:blindwind/constants/color_constants.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_bloc.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_event.dart';
import 'package:blindwind/navigator/bottom_menu_navigator/bottom_menu_navigator_state.dart';
import 'package:blindwind/ui/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomMenuNavigatorBloc _bottomMenuNavigatorBloc;

  @override
  void initState() {
    _bottomMenuNavigatorBloc = BottomMenuNavigatorBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomMenuNavigatorBloc>(
            builder: (BuildContext context) => _bottomMenuNavigatorBloc),
      ],
      child: BlocBuilder(
        bloc: _bottomMenuNavigatorBloc,
        builder: (BuildContext context, BottomMenuNavigatorState state) {
          return BlocListener<BottomMenuNavigatorBloc,
              BottomMenuNavigatorState>(
            bloc: _bottomMenuNavigatorBloc,
            listener: (BuildContext context,
                BottomMenuNavigatorState listeningState) {},
            child: Scaffold(
              body: Container(),
              floatingActionButton: FloatingActionButton(
                child: Icon(
                  MAP_ICON_DATA,
                  color: state is MapPageOpen ? THEMECOLOR : MID_GREY_COLOR,
                ),
                backgroundColor: WHITE_COLOR,
                onPressed: () {
                  _bottomMenuNavigatorBloc.dispatch(MapItemTapped());
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }
}
