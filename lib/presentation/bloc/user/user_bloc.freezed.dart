// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LogInImplCopyWith<$Res> {
  factory _$$LogInImplCopyWith(
          _$LogInImpl value, $Res Function(_$LogInImpl) then) =
      __$$LogInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$LogInImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LogInImpl>
    implements _$$LogInImplCopyWith<$Res> {
  __$$LogInImplCopyWithImpl(
      _$LogInImpl _value, $Res Function(_$LogInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$LogInImpl(
      null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInImpl implements _LogIn {
  const _$LogInImpl(this.login, this.password);

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'UserEvent.logIn(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInImplCopyWith<_$LogInImpl> get copyWith =>
      __$$LogInImplCopyWithImpl<_$LogInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) {
    return logIn(login, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) {
    return logIn?.call(login, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(login, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return logIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return logIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(this);
    }
    return orElse();
  }
}

abstract class _LogIn implements UserEvent {
  const factory _LogIn(final String login, final String password) = _$LogInImpl;

  String get login;
  String get password;
  @JsonKey(ignore: true)
  _$$LogInImplCopyWith<_$LogInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogInfFromCacheImplCopyWith<$Res> {
  factory _$$LogInfFromCacheImplCopyWith(_$LogInfFromCacheImpl value,
          $Res Function(_$LogInfFromCacheImpl) then) =
      __$$LogInfFromCacheImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogInfFromCacheImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LogInfFromCacheImpl>
    implements _$$LogInfFromCacheImplCopyWith<$Res> {
  __$$LogInfFromCacheImplCopyWithImpl(
      _$LogInfFromCacheImpl _value, $Res Function(_$LogInfFromCacheImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogInfFromCacheImpl implements _LogInfFromCache {
  const _$LogInfFromCacheImpl();

  @override
  String toString() {
    return 'UserEvent.getAuthToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogInfFromCacheImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) {
    return getAuthToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) {
    return getAuthToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (getAuthToken != null) {
      return getAuthToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return getAuthToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return getAuthToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (getAuthToken != null) {
      return getAuthToken(this);
    }
    return orElse();
  }
}

abstract class _LogInfFromCache implements UserEvent {
  const factory _LogInfFromCache() = _$LogInfFromCacheImpl;
}

/// @nodoc
abstract class _$$LogOutImplCopyWith<$Res> {
  factory _$$LogOutImplCopyWith(
          _$LogOutImpl value, $Res Function(_$LogOutImpl) then) =
      __$$LogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LogOutImpl>
    implements _$$LogOutImplCopyWith<$Res> {
  __$$LogOutImplCopyWithImpl(
      _$LogOutImpl _value, $Res Function(_$LogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogOutImpl implements _LogOut {
  const _$LogOutImpl();

  @override
  String toString() {
    return 'UserEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements UserEvent {
  const factory _LogOut() = _$LogOutImpl;
}

/// @nodoc
abstract class _$$SignUpImplCopyWith<$Res> {
  factory _$$SignUpImplCopyWith(
          _$SignUpImpl value, $Res Function(_$SignUpImpl) then) =
      __$$SignUpImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String login,
      String password,
      String name,
      String phone,
      String secondname,
      String lastname});
}

/// @nodoc
class __$$SignUpImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SignUpImpl>
    implements _$$SignUpImplCopyWith<$Res> {
  __$$SignUpImplCopyWithImpl(
      _$SignUpImpl _value, $Res Function(_$SignUpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
    Object? name = null,
    Object? phone = null,
    Object? secondname = null,
    Object? lastname = null,
  }) {
    return _then(_$SignUpImpl(
      null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == secondname
          ? _value.secondname
          : secondname // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpImpl implements _SignUp {
  const _$SignUpImpl(this.login, this.password, this.name, this.phone,
      this.secondname, this.lastname);

  @override
  final String login;
  @override
  final String password;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String secondname;
  @override
  final String lastname;

  @override
  String toString() {
    return 'UserEvent.signUp(login: $login, password: $password, name: $name, phone: $phone, secondname: $secondname, lastname: $lastname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.secondname, secondname) ||
                other.secondname == secondname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, login, password, name, phone, secondname, lastname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpImplCopyWith<_$SignUpImpl> get copyWith =>
      __$$SignUpImplCopyWithImpl<_$SignUpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) {
    return signUp(login, password, name, phone, secondname, lastname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) {
    return signUp?.call(login, password, name, phone, secondname, lastname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(login, password, name, phone, secondname, lastname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements UserEvent {
  const factory _SignUp(
      final String login,
      final String password,
      final String name,
      final String phone,
      final String secondname,
      final String lastname) = _$SignUpImpl;

  String get login;
  String get password;
  String get name;
  String get phone;
  String get secondname;
  String get lastname;
  @JsonKey(ignore: true)
  _$$SignUpImplCopyWith<_$SignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
          _$GetUserDataImpl value, $Res Function(_$GetUserDataImpl) then) =
      __$$GetUserDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
      _$GetUserDataImpl _value, $Res Function(_$GetUserDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl();

  @override
  String toString() {
    return 'UserEvent.getUserData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String login, String password) logIn,
    required TResult Function() getAuthToken,
    required TResult Function() logOut,
    required TResult Function(String login, String password, String name,
            String phone, String secondname, String lastname)
        signUp,
    required TResult Function() getUserData,
  }) {
    return getUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String login, String password)? logIn,
    TResult? Function()? getAuthToken,
    TResult? Function()? logOut,
    TResult? Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult? Function()? getUserData,
  }) {
    return getUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String login, String password)? logIn,
    TResult Function()? getAuthToken,
    TResult Function()? logOut,
    TResult Function(String login, String password, String name, String phone,
            String secondname, String lastname)?
        signUp,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogInfFromCache value) getAuthToken,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return getUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogInfFromCache value)? getAuthToken,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return getUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogInfFromCache value)? getAuthToken,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(this);
    }
    return orElse();
  }
}

abstract class _GetUserData implements UserEvent {
  const factory _GetUserData() = _$GetUserDataImpl;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String cause) logInError,
    required TResult Function(User user) logInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String cause)? logInError,
    TResult? Function(User user)? logInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String cause)? logInError,
    TResult Function(User user)? logInSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogInError value) logInError,
    required TResult Function(_LogInSuccess value) logInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogInError value)? logInError,
    TResult? Function(_LogInSuccess value)? logInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogInError value)? logInError,
    TResult Function(_LogInSuccess value)? logInSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl();

  @override
  String toString() {
    return 'UserState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String cause) logInError,
    required TResult Function(User user) logInSuccess,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String cause)? logInError,
    TResult? Function(User user)? logInSuccess,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String cause)? logInError,
    TResult Function(User user)? logInSuccess,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogInError value) logInError,
    required TResult Function(_LogInSuccess value) logInSuccess,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogInError value)? logInError,
    TResult? Function(_LogInSuccess value)? logInSuccess,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogInError value)? logInError,
    TResult Function(_LogInSuccess value)? logInSuccess,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements UserState {
  const factory _Unauthorized() = _$UnauthorizedImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String cause) logInError,
    required TResult Function(User user) logInSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String cause)? logInError,
    TResult? Function(User user)? logInSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String cause)? logInError,
    TResult Function(User user)? logInSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogInError value) logInError,
    required TResult Function(_LogInSuccess value) logInSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogInError value)? logInError,
    TResult? Function(_LogInSuccess value)? logInSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogInError value)? logInError,
    TResult Function(_LogInSuccess value)? logInSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LogInErrorImplCopyWith<$Res> {
  factory _$$LogInErrorImplCopyWith(
          _$LogInErrorImpl value, $Res Function(_$LogInErrorImpl) then) =
      __$$LogInErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class __$$LogInErrorImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LogInErrorImpl>
    implements _$$LogInErrorImplCopyWith<$Res> {
  __$$LogInErrorImplCopyWithImpl(
      _$LogInErrorImpl _value, $Res Function(_$LogInErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cause = null,
  }) {
    return _then(_$LogInErrorImpl(
      null == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInErrorImpl implements _LogInError {
  const _$LogInErrorImpl(this.cause);

  @override
  final String cause;

  @override
  String toString() {
    return 'UserState.logInError(cause: $cause)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInErrorImpl &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInErrorImplCopyWith<_$LogInErrorImpl> get copyWith =>
      __$$LogInErrorImplCopyWithImpl<_$LogInErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String cause) logInError,
    required TResult Function(User user) logInSuccess,
  }) {
    return logInError(cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String cause)? logInError,
    TResult? Function(User user)? logInSuccess,
  }) {
    return logInError?.call(cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String cause)? logInError,
    TResult Function(User user)? logInSuccess,
    required TResult orElse(),
  }) {
    if (logInError != null) {
      return logInError(cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogInError value) logInError,
    required TResult Function(_LogInSuccess value) logInSuccess,
  }) {
    return logInError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogInError value)? logInError,
    TResult? Function(_LogInSuccess value)? logInSuccess,
  }) {
    return logInError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogInError value)? logInError,
    TResult Function(_LogInSuccess value)? logInSuccess,
    required TResult orElse(),
  }) {
    if (logInError != null) {
      return logInError(this);
    }
    return orElse();
  }
}

abstract class _LogInError implements UserState {
  const factory _LogInError(final String cause) = _$LogInErrorImpl;

  String get cause;
  @JsonKey(ignore: true)
  _$$LogInErrorImplCopyWith<_$LogInErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogInSuccessImplCopyWith<$Res> {
  factory _$$LogInSuccessImplCopyWith(
          _$LogInSuccessImpl value, $Res Function(_$LogInSuccessImpl) then) =
      __$$LogInSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$LogInSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LogInSuccessImpl>
    implements _$$LogInSuccessImplCopyWith<$Res> {
  __$$LogInSuccessImplCopyWithImpl(
      _$LogInSuccessImpl _value, $Res Function(_$LogInSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LogInSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$LogInSuccessImpl implements _LogInSuccess {
  const _$LogInSuccessImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.logInSuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInSuccessImplCopyWith<_$LogInSuccessImpl> get copyWith =>
      __$$LogInSuccessImplCopyWithImpl<_$LogInSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String cause) logInError,
    required TResult Function(User user) logInSuccess,
  }) {
    return logInSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String cause)? logInError,
    TResult? Function(User user)? logInSuccess,
  }) {
    return logInSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String cause)? logInError,
    TResult Function(User user)? logInSuccess,
    required TResult orElse(),
  }) {
    if (logInSuccess != null) {
      return logInSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogInError value) logInError,
    required TResult Function(_LogInSuccess value) logInSuccess,
  }) {
    return logInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogInError value)? logInError,
    TResult? Function(_LogInSuccess value)? logInSuccess,
  }) {
    return logInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogInError value)? logInError,
    TResult Function(_LogInSuccess value)? logInSuccess,
    required TResult orElse(),
  }) {
    if (logInSuccess != null) {
      return logInSuccess(this);
    }
    return orElse();
  }
}

abstract class _LogInSuccess implements UserState {
  const factory _LogInSuccess(final User user) = _$LogInSuccessImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$LogInSuccessImplCopyWith<_$LogInSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
