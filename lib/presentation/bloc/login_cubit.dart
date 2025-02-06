import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginButtonPressed({required String username, required String password}) {
    emit(LoginLoading());
    if (username != 'test' || password != 'test') {
      emit(LoginFailure());
      return;
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        emit(LoginSuccess());
      });
    }
  }
}
