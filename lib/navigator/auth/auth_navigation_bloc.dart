import 'package:blindwind/navigator/auth/auth_navigation_event.dart';
import 'package:blindwind/navigator/auth/auth_navigation_state.dart';
import 'package:bloc/bloc.dart';

class LoginPageNavigationBlock
    extends Bloc<LoginPageNavigatorEvent, LoginPageNavigatorState> {
  @override
  LoginPageNavigatorState get initialState => InitialLoginPageNavigatorState();

  @override
  Stream<LoginPageNavigatorState> mapEventToState(
      LoginPageNavigatorEvent event) async* {
    if (event is GoToSignInTapped) {
      yield SignInPageOpen();
    } else if (event is SignInTapped) {
      yield CheckValidation();
    } else if (event is GoToSignUpTapped) {
      yield SignUpPageOpen();
    } else if (event is ForgotPasswordTapped) {
      yield ForgotPasswordPageOpen();
    } else if (event is SignInTapped) {
      yield CheckValidation();
    } else if (event is ValidationIsPassed) {
      yield TryToLoginIn();
    } else if (event is ValidationIsNotPassed) {
      yield NewError();
      yield ShowError(error: event.error);
    }
  }
}
