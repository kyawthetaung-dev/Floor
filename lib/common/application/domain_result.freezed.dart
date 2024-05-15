// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DomainResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(T data)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet<T> value) noConnection,
    required TResult Function(_Result<T> value) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet<T> value)? noConnection,
    TResult? Function(_Result<T> value)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet<T> value)? noConnection,
    TResult Function(_Result<T> value)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainResultCopyWith<T, $Res> {
  factory $DomainResultCopyWith(
          DomainResult<T> value, $Res Function(DomainResult<T>) then) =
      _$DomainResultCopyWithImpl<T, $Res, DomainResult<T>>;
}

/// @nodoc
class _$DomainResultCopyWithImpl<T, $Res, $Val extends DomainResult<T>>
    implements $DomainResultCopyWith<T, $Res> {
  _$DomainResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<T, $Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl<T> value, $Res Function(_$NoInternetImpl<T>) then) =
      __$$NoInternetImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<T, $Res>
    extends _$DomainResultCopyWithImpl<T, $Res, _$NoInternetImpl<T>>
    implements _$$NoInternetImplCopyWith<T, $Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl<T> _value, $Res Function(_$NoInternetImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetImpl<T> implements _NoInternet<T> {
  _$NoInternetImpl();

  @override
  String toString() {
    return 'DomainResult<$T>.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) result,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(T data)? result,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet<T> value) noConnection,
    required TResult Function(_Result<T> value) result,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet<T> value)? noConnection,
    TResult? Function(_Result<T> value)? result,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet<T> value)? noConnection,
    TResult Function(_Result<T> value)? result,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoInternet<T> implements DomainResult<T> {
  factory _NoInternet() = _$NoInternetImpl<T>;
}

/// @nodoc
abstract class _$$ResultImplCopyWith<T, $Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl<T> value, $Res Function(_$ResultImpl<T>) then) =
      __$$ResultImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<T, $Res>
    extends _$DomainResultCopyWithImpl<T, $Res, _$ResultImpl<T>>
    implements _$$ResultImplCopyWith<T, $Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl<T> _value, $Res Function(_$ResultImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResultImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResultImpl<T> implements _Result<T> {
  _$ResultImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DomainResult<$T>.result(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<T, _$ResultImpl<T>> get copyWith =>
      __$$ResultImplCopyWithImpl<T, _$ResultImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) result,
  }) {
    return result(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noConnection,
    TResult? Function(T data)? result,
  }) {
    return result?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoInternet<T> value) noConnection,
    required TResult Function(_Result<T> value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoInternet<T> value)? noConnection,
    TResult? Function(_Result<T> value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoInternet<T> value)? noConnection,
    TResult Function(_Result<T> value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _Result<T> implements DomainResult<T> {
  factory _Result(final T data) = _$ResultImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<T, _$ResultImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
