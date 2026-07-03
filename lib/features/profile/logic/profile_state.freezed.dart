// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ProfileLoading,
    required TResult Function(ProfileModel user) ProfileSuccess,
    required TResult Function(String message) ProfileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ProfileLoading,
    TResult? Function(ProfileModel user)? ProfileSuccess,
    TResult? Function(String message)? ProfileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ProfileLoading,
    TResult Function(ProfileModel user)? ProfileSuccess,
    TResult Function(String message)? ProfileError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(ProfileLoading value) ProfileLoading,
    required TResult Function(ProfileSuccess value) ProfileSuccess,
    required TResult Function(ProfileError value) ProfileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(ProfileLoading value)? ProfileLoading,
    TResult? Function(ProfileSuccess value)? ProfileSuccess,
    TResult? Function(ProfileError value)? ProfileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(ProfileLoading value)? ProfileLoading,
    TResult Function(ProfileSuccess value)? ProfileSuccess,
    TResult Function(ProfileError value)? ProfileError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$initialImplCopyWith<$Res> {
  factory _$$initialImplCopyWith(
          _$initialImpl value, $Res Function(_$initialImpl) then) =
      __$$initialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$initialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$initialImpl>
    implements _$$initialImplCopyWith<$Res> {
  __$$initialImplCopyWithImpl(
      _$initialImpl _value, $Res Function(_$initialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialImpl with DiagnosticableTreeMixin implements _initial {
  const _$initialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProfileState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ProfileLoading,
    required TResult Function(ProfileModel user) ProfileSuccess,
    required TResult Function(String message) ProfileError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ProfileLoading,
    TResult? Function(ProfileModel user)? ProfileSuccess,
    TResult? Function(String message)? ProfileError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ProfileLoading,
    TResult Function(ProfileModel user)? ProfileSuccess,
    TResult Function(String message)? ProfileError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(ProfileLoading value) ProfileLoading,
    required TResult Function(ProfileSuccess value) ProfileSuccess,
    required TResult Function(ProfileError value) ProfileError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(ProfileLoading value)? ProfileLoading,
    TResult? Function(ProfileSuccess value)? ProfileSuccess,
    TResult? Function(ProfileError value)? ProfileError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(ProfileLoading value)? ProfileLoading,
    TResult Function(ProfileSuccess value)? ProfileSuccess,
    TResult Function(ProfileError value)? ProfileError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial implements ProfileState {
  const factory _initial() = _$initialImpl;
}

/// @nodoc
abstract class _$$ProfileLoadingImplCopyWith<$Res> {
  factory _$$ProfileLoadingImplCopyWith(_$ProfileLoadingImpl value,
          $Res Function(_$ProfileLoadingImpl) then) =
      __$$ProfileLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileLoadingImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadingImpl>
    implements _$$ProfileLoadingImplCopyWith<$Res> {
  __$$ProfileLoadingImplCopyWithImpl(
      _$ProfileLoadingImpl _value, $Res Function(_$ProfileLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileLoadingImpl
    with DiagnosticableTreeMixin
    implements ProfileLoading {
  const _$ProfileLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState.ProfileLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProfileState.ProfileLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ProfileLoading,
    required TResult Function(ProfileModel user) ProfileSuccess,
    required TResult Function(String message) ProfileError,
  }) {
    return ProfileLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ProfileLoading,
    TResult? Function(ProfileModel user)? ProfileSuccess,
    TResult? Function(String message)? ProfileError,
  }) {
    return ProfileLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ProfileLoading,
    TResult Function(ProfileModel user)? ProfileSuccess,
    TResult Function(String message)? ProfileError,
    required TResult orElse(),
  }) {
    if (ProfileLoading != null) {
      return ProfileLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(ProfileLoading value) ProfileLoading,
    required TResult Function(ProfileSuccess value) ProfileSuccess,
    required TResult Function(ProfileError value) ProfileError,
  }) {
    return ProfileLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(ProfileLoading value)? ProfileLoading,
    TResult? Function(ProfileSuccess value)? ProfileSuccess,
    TResult? Function(ProfileError value)? ProfileError,
  }) {
    return ProfileLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(ProfileLoading value)? ProfileLoading,
    TResult Function(ProfileSuccess value)? ProfileSuccess,
    TResult Function(ProfileError value)? ProfileError,
    required TResult orElse(),
  }) {
    if (ProfileLoading != null) {
      return ProfileLoading(this);
    }
    return orElse();
  }
}

abstract class ProfileLoading implements ProfileState {
  const factory ProfileLoading() = _$ProfileLoadingImpl;
}

/// @nodoc
abstract class _$$ProfileSuccessImplCopyWith<$Res> {
  factory _$$ProfileSuccessImplCopyWith(_$ProfileSuccessImpl value,
          $Res Function(_$ProfileSuccessImpl) then) =
      __$$ProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileModel user});
}

/// @nodoc
class __$$ProfileSuccessImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileSuccessImpl>
    implements _$$ProfileSuccessImplCopyWith<$Res> {
  __$$ProfileSuccessImplCopyWithImpl(
      _$ProfileSuccessImpl _value, $Res Function(_$ProfileSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ProfileSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$ProfileSuccessImpl
    with DiagnosticableTreeMixin
    implements ProfileSuccess {
  const _$ProfileSuccessImpl(this.user);

  @override
  final ProfileModel user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState.ProfileSuccess(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileState.ProfileSuccess'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSuccessImplCopyWith<_$ProfileSuccessImpl> get copyWith =>
      __$$ProfileSuccessImplCopyWithImpl<_$ProfileSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ProfileLoading,
    required TResult Function(ProfileModel user) ProfileSuccess,
    required TResult Function(String message) ProfileError,
  }) {
    return ProfileSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ProfileLoading,
    TResult? Function(ProfileModel user)? ProfileSuccess,
    TResult? Function(String message)? ProfileError,
  }) {
    return ProfileSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ProfileLoading,
    TResult Function(ProfileModel user)? ProfileSuccess,
    TResult Function(String message)? ProfileError,
    required TResult orElse(),
  }) {
    if (ProfileSuccess != null) {
      return ProfileSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(ProfileLoading value) ProfileLoading,
    required TResult Function(ProfileSuccess value) ProfileSuccess,
    required TResult Function(ProfileError value) ProfileError,
  }) {
    return ProfileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(ProfileLoading value)? ProfileLoading,
    TResult? Function(ProfileSuccess value)? ProfileSuccess,
    TResult? Function(ProfileError value)? ProfileError,
  }) {
    return ProfileSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(ProfileLoading value)? ProfileLoading,
    TResult Function(ProfileSuccess value)? ProfileSuccess,
    TResult Function(ProfileError value)? ProfileError,
    required TResult orElse(),
  }) {
    if (ProfileSuccess != null) {
      return ProfileSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileSuccess implements ProfileState {
  const factory ProfileSuccess(final ProfileModel user) = _$ProfileSuccessImpl;

  ProfileModel get user;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSuccessImplCopyWith<_$ProfileSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorImplCopyWith<$Res> {
  factory _$$ProfileErrorImplCopyWith(
          _$ProfileErrorImpl value, $Res Function(_$ProfileErrorImpl) then) =
      __$$ProfileErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProfileErrorImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileErrorImpl>
    implements _$$ProfileErrorImplCopyWith<$Res> {
  __$$ProfileErrorImplCopyWithImpl(
      _$ProfileErrorImpl _value, $Res Function(_$ProfileErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProfileErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileErrorImpl with DiagnosticableTreeMixin implements ProfileError {
  const _$ProfileErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState.ProfileError(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileState.ProfileError'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileErrorImplCopyWith<_$ProfileErrorImpl> get copyWith =>
      __$$ProfileErrorImplCopyWithImpl<_$ProfileErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ProfileLoading,
    required TResult Function(ProfileModel user) ProfileSuccess,
    required TResult Function(String message) ProfileError,
  }) {
    return ProfileError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ProfileLoading,
    TResult? Function(ProfileModel user)? ProfileSuccess,
    TResult? Function(String message)? ProfileError,
  }) {
    return ProfileError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ProfileLoading,
    TResult Function(ProfileModel user)? ProfileSuccess,
    TResult Function(String message)? ProfileError,
    required TResult orElse(),
  }) {
    if (ProfileError != null) {
      return ProfileError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(ProfileLoading value) ProfileLoading,
    required TResult Function(ProfileSuccess value) ProfileSuccess,
    required TResult Function(ProfileError value) ProfileError,
  }) {
    return ProfileError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(ProfileLoading value)? ProfileLoading,
    TResult? Function(ProfileSuccess value)? ProfileSuccess,
    TResult? Function(ProfileError value)? ProfileError,
  }) {
    return ProfileError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(ProfileLoading value)? ProfileLoading,
    TResult Function(ProfileSuccess value)? ProfileSuccess,
    TResult Function(ProfileError value)? ProfileError,
    required TResult orElse(),
  }) {
    if (ProfileError != null) {
      return ProfileError(this);
    }
    return orElse();
  }
}

abstract class ProfileError implements ProfileState {
  const factory ProfileError(final String message) = _$ProfileErrorImpl;

  String get message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileErrorImplCopyWith<_$ProfileErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
