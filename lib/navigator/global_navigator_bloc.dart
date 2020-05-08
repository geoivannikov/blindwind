import 'package:blindwind/navigator/global_navigator_event.dart';
import 'package:blindwind/navigator/global_navigator_state.dart';
import 'package:blindwind/service/use_case/user/select_user_use_case.dart';
import 'package:blindwind/service/use_case/walkthrough/is_walkthrough_viewed_state_use_case.dart';
import 'package:blindwind/service/use_case/walkthrough/make_walkthrough_viewed_state_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class GlobalNavigatorBloc
    extends Bloc<GlobalNavigatorEvent, GlobalNavigatorState> {
  SelectUserUseCase _selectUserUseCase;
  IsWalkthroughViewedUseCase _isWalkthroughViewedUseCase;
  MakeWalkthroughViewedUseCase _makeWalkthroughViewedUseCase;
  @override
  GlobalNavigatorState get initialState => LoadingGlobalNavigatorState();

  GlobalNavigatorBloc({
    @required SelectUserUseCase selectUserUseCase,
    @required IsWalkthroughViewedUseCase isWalkthroughViewedUseCase,
    @required MakeWalkthroughViewedUseCase makeWalkthroughViewedUseCase,
  })  : _selectUserUseCase = selectUserUseCase,
        _isWalkthroughViewedUseCase = isWalkthroughViewedUseCase,
        _makeWalkthroughViewedUseCase = makeWalkthroughViewedUseCase;

  @override
  Stream<GlobalNavigatorState> mapEventToState(
      GlobalNavigatorEvent event) async* {
    if (event is AppOpen) {
      if (!(await _isWalkthroughViewedUseCase.createRequest())) {
        yield WalkthroughHasNotSeen();
      } else if (await _selectUserUseCase.createRequest() != null) {
        yield UserAuthed();
      } else {
        yield UserNotAuthed();
      }
    } else if (event is WalkthroughFinished) {
      await _makeWalkthroughViewedUseCase.createRequest();
      yield UserNotAuthed();
    } else if (event is AuthFinished) {
      yield UserAuthed();
    }
  }
}
