import 'package:blindwind/navigator/walkthrough/walkthrough_navigator_event.dart';
import 'package:blindwind/navigator/walkthrough/walkthrough_navigator_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class WalkthroughNavigatorBloc extends Bloc<WalkthroughNavigatorEvent, WalkthroughNavigatorState> {
  final int _numberOfPages;
  int _currentPage;

  @override
  WalkthroughNavigatorState get initialState => InitialWalkthroughNavigatorState();

  WalkthroughNavigatorBloc({
    @required int numberOfPages,
  })  : _numberOfPages = numberOfPages;

  @override
  Stream<WalkthroughNavigatorState> mapEventToState(WalkthroughNavigatorEvent event) async* {
    if (event is WalkthroughOpen) {
      _currentPage = 0;
      yield WalkthroughFirstPageOpen();
    }
    if (event is WalkthroughNextTapped) {
      if (_currentPage < _numberOfPages){
        _currentPage++;
      }
      if (_currentPage == _numberOfPages) {
        yield WalkthroughPageChangedOpen();
        yield WalkthroughLastPageOpen();
      } else {
        yield WalkthroughPageChangedOpen();
        yield WalkthroughPageOpen(pageNumber: _currentPage);
      }
    }
    if (event is WalkthroughBackTapped) {
      if (_currentPage > 0){
        _currentPage--;
      }
      if (_currentPage == 0) {
        yield WalkthroughPageChangedOpen();
        yield WalkthroughFirstPageOpen();
      } else {
        yield WalkthroughPageChangedOpen();
        yield WalkthroughPageOpen(pageNumber: _currentPage);
      }
    }
  }
}