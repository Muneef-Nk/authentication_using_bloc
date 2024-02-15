import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      try {
        final email = event.email;
        final password = event.password;

        if (!email.contains("@")) {
          return emit(LoginFailed(error: "must enter valid email"));
        }
        if (password.length < 6) {
          return emit(LoginFailed(error: "password must be 6 charactor"));
        }
        emit(AuthLoading());

        await Future.delayed(Duration(seconds: 2), () {
          return emit(LoginSuccess(success: "Successfully logedin"));
        });
      } catch (e) {
        return emit(ErrorState(error: e.toString()));
      }
    });

    on<AuthLogoutRequest>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 3), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        return emit(ErrorState(error: e.toString()));
      }
    });
  }
}
