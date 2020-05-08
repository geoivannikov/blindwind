import 'package:blindwind/bloc/user/user_bloc.dart';
import 'package:blindwind/constants/base_constants.dart';
import 'package:blindwind/di/injector.dart';
import 'package:blindwind/navigator/global_navigator_bloc.dart';
import 'package:blindwind/navigator/global_navigator_event.dart';
import 'package:blindwind/navigator/global_navigator_state.dart';
import 'package:blindwind/ui/home_page.dart';
import 'package:blindwind/ui/auth/login_page.dart';
import 'package:blindwind/ui/walkthrough/walkthrough_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  GlobalNavigatorBloc _globalNavigatorBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    _globalNavigatorBloc = GlobalNavigatorBloc(
        isWalkthroughViewedUseCase: Injector().isWalkthroughViewedUseCase,
        makeWalkthroughViewedUseCase: Injector().makeWalkthroughViewedUseCase,
        selectUserUseCase: Injector().selectUserUseCase);
    _userBloc = UserBloc(
        loginUserUseCase: Injector().loginUserUseCase,
        selectUserUseCase: Injector().selectUserUseCase);
    _globalNavigatorBloc.dispatch(AppOpen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true)
      ..init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalNavigatorBloc>(
            builder: (BuildContext context) => _globalNavigatorBloc),
        BlocProvider<UserBloc>(builder: (BuildContext context) => _userBloc),
      ],
      child: BlocBuilder(
        bloc: _globalNavigatorBloc,
        builder: (context, state) {
          if (state is WalkthroughHasNotSeen) {
            return WalkthroughPage();
          } else if (state is UserAuthed) {
            return HomePage();
          } else if (state is UserNotAuthed) {
            return LoginPage();
          }
          return Container();
        },
      ),
    );
  }
}
