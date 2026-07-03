// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<Movie> movies) SearchSuccess,
    required TResult Function(ErrorHandler e) SearchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<Movie> movies)? SearchSuccess,
    TResult? Function(ErrorHandler e)? SearchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<Movie> movies)? SearchSuccess,
    TResult Function(ErrorHandler e)? SearchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(searchLoading value) searchLoading,
    required TResult Function(SearchSuccess value) SearchSuccess,
    required TResult Function(SearchError value) SearchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(searchLoading value)? searchLoading,
    TResult? Function(SearchSuccess value)? SearchSuccess,
    TResult? Function(SearchError value)? SearchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(searchLoading value)? searchLoading,
    TResult Function(SearchSuccess value)? SearchSuccess,
    TResult Function(SearchError value)? SearchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
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
    extends _$SearchStateCopyWithImpl<$Res, _$initialImpl>
    implements _$$initialImplCopyWith<$Res> {
  __$$initialImplCopyWithImpl(
      _$initialImpl _value, $Res Function(_$initialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$initialImpl implements _initial {
  const _$initialImpl();

  @override
  String toString() {
    return 'SearchState.initial()';
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
    required TResult Function() searchLoading,
    required TResult Function(List<Movie> movies) SearchSuccess,
    required TResult Function(ErrorHandler e) SearchError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<Movie> movies)? SearchSuccess,
    TResult? Function(ErrorHandler e)? SearchError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<Movie> movies)? SearchSuccess,
    TResult Function(ErrorHandler e)? SearchError,
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
    required TResult Function(searchLoading value) searchLoading,
    required TResult Function(SearchSuccess value) SearchSuccess,
    required TResult Function(SearchError value) SearchError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(searchLoading value)? searchLoading,
    TResult? Function(SearchSuccess value)? SearchSuccess,
    TResult? Function(SearchError value)? SearchError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(searchLoading value)? searchLoading,
    TResult Function(SearchSuccess value)? SearchSuccess,
    TResult Function(SearchError value)? SearchError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial implements SearchState {
  const factory _initial() = _$initialImpl;
}

/// @nodoc
abstract class _$$searchLoadingImplCopyWith<$Res> {
  factory _$$searchLoadingImplCopyWith(
          _$searchLoadingImpl value, $Res Function(_$searchLoadingImpl) then) =
      __$$searchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$searchLoadingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$searchLoadingImpl>
    implements _$$searchLoadingImplCopyWith<$Res> {
  __$$searchLoadingImplCopyWithImpl(
      _$searchLoadingImpl _value, $Res Function(_$searchLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$searchLoadingImpl implements searchLoading {
  const _$searchLoadingImpl();

  @override
  String toString() {
    return 'SearchState.searchLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$searchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<Movie> movies) SearchSuccess,
    required TResult Function(ErrorHandler e) SearchError,
  }) {
    return searchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<Movie> movies)? SearchSuccess,
    TResult? Function(ErrorHandler e)? SearchError,
  }) {
    return searchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<Movie> movies)? SearchSuccess,
    TResult Function(ErrorHandler e)? SearchError,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(searchLoading value) searchLoading,
    required TResult Function(SearchSuccess value) SearchSuccess,
    required TResult Function(SearchError value) SearchError,
  }) {
    return searchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(searchLoading value)? searchLoading,
    TResult? Function(SearchSuccess value)? SearchSuccess,
    TResult? Function(SearchError value)? SearchError,
  }) {
    return searchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(searchLoading value)? searchLoading,
    TResult Function(SearchSuccess value)? SearchSuccess,
    TResult Function(SearchError value)? SearchError,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading(this);
    }
    return orElse();
  }
}

abstract class searchLoading implements SearchState {
  const factory searchLoading() = _$searchLoadingImpl;
}

/// @nodoc
abstract class _$$SearchSuccessImplCopyWith<$Res> {
  factory _$$SearchSuccessImplCopyWith(
          _$SearchSuccessImpl value, $Res Function(_$SearchSuccessImpl) then) =
      __$$SearchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Movie> movies});
}

/// @nodoc
class __$$SearchSuccessImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchSuccessImpl>
    implements _$$SearchSuccessImplCopyWith<$Res> {
  __$$SearchSuccessImplCopyWithImpl(
      _$SearchSuccessImpl _value, $Res Function(_$SearchSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_$SearchSuccessImpl(
      null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$SearchSuccessImpl implements SearchSuccess {
  const _$SearchSuccessImpl(final List<Movie> movies) : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  String toString() {
    return 'SearchState.SearchSuccess(movies: $movies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuccessImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movies));

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuccessImplCopyWith<_$SearchSuccessImpl> get copyWith =>
      __$$SearchSuccessImplCopyWithImpl<_$SearchSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<Movie> movies) SearchSuccess,
    required TResult Function(ErrorHandler e) SearchError,
  }) {
    return SearchSuccess(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<Movie> movies)? SearchSuccess,
    TResult? Function(ErrorHandler e)? SearchError,
  }) {
    return SearchSuccess?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<Movie> movies)? SearchSuccess,
    TResult Function(ErrorHandler e)? SearchError,
    required TResult orElse(),
  }) {
    if (SearchSuccess != null) {
      return SearchSuccess(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(searchLoading value) searchLoading,
    required TResult Function(SearchSuccess value) SearchSuccess,
    required TResult Function(SearchError value) SearchError,
  }) {
    return SearchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(searchLoading value)? searchLoading,
    TResult? Function(SearchSuccess value)? SearchSuccess,
    TResult? Function(SearchError value)? SearchError,
  }) {
    return SearchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(searchLoading value)? searchLoading,
    TResult Function(SearchSuccess value)? SearchSuccess,
    TResult Function(SearchError value)? SearchError,
    required TResult orElse(),
  }) {
    if (SearchSuccess != null) {
      return SearchSuccess(this);
    }
    return orElse();
  }
}

abstract class SearchSuccess implements SearchState {
  const factory SearchSuccess(final List<Movie> movies) = _$SearchSuccessImpl;

  List<Movie> get movies;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSuccessImplCopyWith<_$SearchSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchErrorImplCopyWith<$Res> {
  factory _$$SearchErrorImplCopyWith(
          _$SearchErrorImpl value, $Res Function(_$SearchErrorImpl) then) =
      __$$SearchErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler e});
}

/// @nodoc
class __$$SearchErrorImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchErrorImpl>
    implements _$$SearchErrorImplCopyWith<$Res> {
  __$$SearchErrorImplCopyWithImpl(
      _$SearchErrorImpl _value, $Res Function(_$SearchErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$SearchErrorImpl(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$SearchErrorImpl implements SearchError {
  const _$SearchErrorImpl(this.e);

  @override
  final ErrorHandler e;

  @override
  String toString() {
    return 'SearchState.SearchError(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchErrorImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchErrorImplCopyWith<_$SearchErrorImpl> get copyWith =>
      __$$SearchErrorImplCopyWithImpl<_$SearchErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(List<Movie> movies) SearchSuccess,
    required TResult Function(ErrorHandler e) SearchError,
  }) {
    return SearchError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(List<Movie> movies)? SearchSuccess,
    TResult? Function(ErrorHandler e)? SearchError,
  }) {
    return SearchError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(List<Movie> movies)? SearchSuccess,
    TResult Function(ErrorHandler e)? SearchError,
    required TResult orElse(),
  }) {
    if (SearchError != null) {
      return SearchError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
    required TResult Function(searchLoading value) searchLoading,
    required TResult Function(SearchSuccess value) SearchSuccess,
    required TResult Function(SearchError value) SearchError,
  }) {
    return SearchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
    TResult? Function(searchLoading value)? searchLoading,
    TResult? Function(SearchSuccess value)? SearchSuccess,
    TResult? Function(SearchError value)? SearchError,
  }) {
    return SearchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    TResult Function(searchLoading value)? searchLoading,
    TResult Function(SearchSuccess value)? SearchSuccess,
    TResult Function(SearchError value)? SearchError,
    required TResult orElse(),
  }) {
    if (SearchError != null) {
      return SearchError(this);
    }
    return orElse();
  }
}

abstract class SearchError implements SearchState {
  const factory SearchError(final ErrorHandler e) = _$SearchErrorImpl;

  ErrorHandler get e;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchErrorImplCopyWith<_$SearchErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
