part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.logIn(String login, String password) = _LogIn;
  const factory UserEvent.getAuthToken() = _LogInfFromCache;
  const factory UserEvent.logOut() = _LogOut;
  const factory UserEvent.signUp(String login, String password, String name,
      String phone, String secondname, String lastname) = _SignUp;
  const factory UserEvent.getUserData() = _GetUserData;
}
