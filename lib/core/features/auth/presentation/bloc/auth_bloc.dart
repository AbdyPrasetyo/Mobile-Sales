import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_apps/core/features/auth/domain/usecases/login_usecase.dart';


abstract class AuthEvent {}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
class RegisterFaceEvent extends AuthEvent {
  final String email;
  final String imagePath;
  RegisterFaceEvent(this.email, this.imagePath);
}
class FaceLoginEvent extends AuthEvent {
  final String email;
  final String imagePath;
  FaceLoginEvent(this.email, this.imagePath);
}

abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final dynamic data;
  AuthSuccess(this.data);
}
class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await loginUseCase.call(event.email, event.password);
        emit(AuthSuccess(result));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}