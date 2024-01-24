import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:agro_hack23/domain/entities/business.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/usecases/get_auth_token.dart';
import 'package:agro_hack23/domain/usecases/get_user_data.dart';
import 'package:agro_hack23/domain/usecases/log_in.dart';
import 'package:agro_hack23/domain/usecases/log_out.dart';
import 'package:agro_hack23/domain/usecases/sign_up.dart';
part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LogIn logIn;
  final LogOut logOut;
  final SignUp registration;
  final GetUserData getUserData;
  final GetAuthToken getAuthToken;

  UserBloc({
    required this.logIn,
    required this.logOut,
    required this.getUserData,
    required this.getAuthToken,
    required this.registration,
  }) : super(const _Loading()) {
    on<_LogIn>(_onLogInEvent);
    on<_LogInfFromCache>(_onAuthLogInFromCache);
    on<_LogOut>(_onLogOutEvent);
    on<_SignUp>(_signUp);
    on<_Started>(_onGetUserDataEvent);
    on<_GetUserData>(_onGetUserDataEvent);
  }
  void _onAuthLogInFromCache(
    _LogInfFromCache eveGnt,
    Emitter<UserState> emit,
  ) async {
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const _Unauthorized());
    }, (token) async {
      print(token);
      final user = await getUserData();
      emit(user.fold(
          (failureRemote) => _LogInError(failureRemote.cause ??
              "Ошибка при авторизации. Повторите попытку"),
          (userFromRemote) => _LogInSuccess(userFromRemote)));
    });
  }

  void _onLogInEvent(
    _LogIn event,
    Emitter<UserState> emit,
  ) async {
    final res = await logIn(LogInParams(event.login, event.password));
    emit(const _Loading());

    await res.fold((failure) async {
      emit(_LogInError(
          failure.cause ?? "Ошибка при авторизации. Повторите попытку"));
      emit(const _Unauthorized());
    }, (token) async {
      final user = await getUserData();
      emit(user.fold(
          (failureRemote) => _LogInError(failureRemote.cause ??
              "Ошибка при авторизации. Повторите попытку"),
          (userFromRemote) => _LogInSuccess(userFromRemote)));
    });
  }

  void _signUp(
    _SignUp event,
    Emitter<UserState> emit,
  ) async {
    final res = await registration(SignUpParams(event.login, event.password,
        event.name, event.secondname, event.lastname, event.phone));

    await res.fold((failure) async {
      emit(_LogInError(
          failure.cause ?? "Ошибка при авторизации. Повторите попытку"));
    }, (token) async {
      print(token);
      final user = await getUserData(token);

      emit(user.fold(
          (failureRemote) => _LogInError(failureRemote.cause ??
              "Ошибка при авторизации. Повторите попытку"),
          (userFromRemote) => _LogInSuccess(userFromRemote)));
    });
  }

  void _onLogOutEvent(
    UserEvent event,
    Emitter<UserState> emit,
  ) async {
    final res = await logOut();
    res.fold((failure) => null, (r) => emit(const _Unauthorized()));
  }

  void _onGetUserDataEvent(
    UserEvent event,
    Emitter<UserState> emit,
  ) async {
    final token = await getAuthToken();

    await token.fold((failure) async {
      _LogInError(failure.cause ?? "Ошибка при авторизации. Повторите попытку");
      emit(const _Unauthorized());
    }, (tok) async {
      print(tok);
      // If token in the storage, user is authorized at least once and we can
      // try to get user data
      emit(const _Loading());
      final user = await getUserData();
      print("user");
      user.fold((failure) => emit(const _Unauthorized()), (r) {
        emit(_LogInSuccess(r));
      });
    });
  }
}
