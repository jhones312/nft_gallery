// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PortfolioEntity {
  String get walletAddress => throw _privateConstructorUsedError;
  double get balanceEth => throw _privateConstructorUsedError;
  String get balanceFormatted => throw _privateConstructorUsedError;
  List<NFTModel> get nfts => throw _privateConstructorUsedError;
  int get totalNftCount => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioEntityCopyWith<PortfolioEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioEntityCopyWith<$Res> {
  factory $PortfolioEntityCopyWith(
          PortfolioEntity value, $Res Function(PortfolioEntity) then) =
      _$PortfolioEntityCopyWithImpl<$Res, PortfolioEntity>;
  @useResult
  $Res call(
      {String walletAddress,
      double balanceEth,
      String balanceFormatted,
      List<NFTModel> nfts,
      int totalNftCount});
}

/// @nodoc
class _$PortfolioEntityCopyWithImpl<$Res, $Val extends PortfolioEntity>
    implements $PortfolioEntityCopyWith<$Res> {
  _$PortfolioEntityCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
    Object? balanceEth = null,
    Object? balanceFormatted = null,
    Object? nfts = null,
    Object? totalNftCount = null,
  }) {
    return _then(_value.copyWith(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      balanceEth: null == balanceEth
          ? _value.balanceEth
          : balanceEth // ignore: cast_nullable_to_non_nullable
              as double,
      balanceFormatted: null == balanceFormatted
          ? _value.balanceFormatted
          : balanceFormatted // ignore: cast_nullable_to_non_nullable
              as String,
      nfts: null == nfts
          ? _value.nfts
          : nfts // ignore: cast_nullable_to_non_nullable
              as List<NFTModel>,
      totalNftCount: null == totalNftCount
          ? _value.totalNftCount
          : totalNftCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioEntityImplCopyWith<$Res>
    implements $PortfolioEntityCopyWith<$Res> {
  factory _$$PortfolioEntityImplCopyWith(_$PortfolioEntityImpl value,
          $Res Function(_$PortfolioEntityImpl) then) =
      __$$PortfolioEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String walletAddress,
      double balanceEth,
      String balanceFormatted,
      List<NFTModel> nfts,
      int totalNftCount});
}

/// @nodoc
class __$$PortfolioEntityImplCopyWithImpl<$Res>
    extends _$PortfolioEntityCopyWithImpl<$Res, _$PortfolioEntityImpl>
    implements _$$PortfolioEntityImplCopyWith<$Res> {
  __$$PortfolioEntityImplCopyWithImpl(
      _$PortfolioEntityImpl _value, $Res Function(_$PortfolioEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
    Object? balanceEth = null,
    Object? balanceFormatted = null,
    Object? nfts = null,
    Object? totalNftCount = null,
  }) {
    return _then(_$PortfolioEntityImpl(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      balanceEth: null == balanceEth
          ? _value.balanceEth
          : balanceEth // ignore: cast_nullable_to_non_nullable
              as double,
      balanceFormatted: null == balanceFormatted
          ? _value.balanceFormatted
          : balanceFormatted // ignore: cast_nullable_to_non_nullable
              as String,
      nfts: null == nfts
          ? _value._nfts
          : nfts // ignore: cast_nullable_to_non_nullable
              as List<NFTModel>,
      totalNftCount: null == totalNftCount
          ? _value.totalNftCount
          : totalNftCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$PortfolioEntityImpl implements _PortfolioEntity {
  const _$PortfolioEntityImpl(
      {required this.walletAddress,
      required this.balanceEth,
      required this.balanceFormatted,
      required final List<NFTModel> nfts,
      this.totalNftCount = 0})
      : _nfts = nfts;

  @override
  final String walletAddress;
  @override
  final double balanceEth;
  @override
  final String balanceFormatted;
  final List<NFTModel> _nfts;
  @override
  List<NFTModel> get nfts {
    if (_nfts is EqualUnmodifiableListView) return _nfts;
    return EqualUnmodifiableListView(_nfts);
  }

  @override
  @JsonKey()
  final int totalNftCount;

  @override
  String toString() {
    return 'PortfolioEntity(walletAddress: $walletAddress, balanceEth: $balanceEth, balanceFormatted: $balanceFormatted, nfts: $nfts, totalNftCount: $totalNftCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioEntityImpl &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.balanceEth, balanceEth) ||
                other.balanceEth == balanceEth) &&
            (identical(other.balanceFormatted, balanceFormatted) ||
                other.balanceFormatted == balanceFormatted) &&
            const DeepCollectionEquality().equals(other._nfts, _nfts) &&
            (identical(other.totalNftCount, totalNftCount) ||
                other.totalNftCount == totalNftCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      walletAddress,
      balanceEth,
      balanceFormatted,
      const DeepCollectionEquality().hash(_nfts),
      totalNftCount);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioEntityImplCopyWith<_$PortfolioEntityImpl> get copyWith =>
      __$$PortfolioEntityImplCopyWithImpl<_$PortfolioEntityImpl>(
          this, _$identity);
}

abstract class _PortfolioEntity implements PortfolioEntity {
  const factory _PortfolioEntity(
      {required final String walletAddress,
      required final double balanceEth,
      required final String balanceFormatted,
      required final List<NFTModel> nfts,
      final int totalNftCount}) = _$PortfolioEntityImpl;

  @override
  String get walletAddress;
  @override
  double get balanceEth;
  @override
  String get balanceFormatted;
  @override
  List<NFTModel> get nfts;
  @override
  int get totalNftCount;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioEntityImplCopyWith<_$PortfolioEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
