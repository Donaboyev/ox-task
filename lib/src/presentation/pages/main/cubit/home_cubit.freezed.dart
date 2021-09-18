// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {bool isLoading = true,
      List<Variations> products = const [],
      int page = 0,
      int totalCount = 0,
      bool isFetchPaginationLoading = false}) {
    return _HomeState(
      isLoading: isLoading,
      products: products,
      page: page,
      totalCount: totalCount,
      isFetchPaginationLoading: isFetchPaginationLoading,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Variations> get products => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  bool get isFetchPaginationLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<Variations> products,
      int page,
      int totalCount,
      bool isFetchPaginationLoading});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? products = freezed,
    Object? page = freezed,
    Object? totalCount = freezed,
    Object? isFetchPaginationLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Variations>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFetchPaginationLoading: isFetchPaginationLoading == freezed
          ? _value.isFetchPaginationLoading
          : isFetchPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<Variations> products,
      int page,
      int totalCount,
      bool isFetchPaginationLoading});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? products = freezed,
    Object? page = freezed,
    Object? totalCount = freezed,
    Object? isFetchPaginationLoading = freezed,
  }) {
    return _then(_HomeState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Variations>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      isFetchPaginationLoading: isFetchPaginationLoading == freezed
          ? _value.isFetchPaginationLoading
          : isFetchPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  const _$_HomeState(
      {this.isLoading = true,
      this.products = const [],
      this.page = 0,
      this.totalCount = 0,
      this.isFetchPaginationLoading = false});

  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: const [])
  @override
  final List<Variations> products;
  @JsonKey(defaultValue: 0)
  @override
  final int page;
  @JsonKey(defaultValue: 0)
  @override
  final int totalCount;
  @JsonKey(defaultValue: false)
  @override
  final bool isFetchPaginationLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(isLoading: $isLoading, products: $products, page: $page, totalCount: $totalCount, isFetchPaginationLoading: $isFetchPaginationLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('products', products))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty(
          'isFetchPaginationLoading', isFetchPaginationLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(
                    other.isFetchPaginationLoading, isFetchPaginationLoading) ||
                const DeepCollectionEquality().equals(
                    other.isFetchPaginationLoading, isFetchPaginationLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(isFetchPaginationLoading);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {bool isLoading,
      List<Variations> products,
      int page,
      int totalCount,
      bool isFetchPaginationLoading}) = _$_HomeState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  List<Variations> get products => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  int get totalCount => throw _privateConstructorUsedError;
  @override
  bool get isFetchPaginationLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
