// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_model.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NFTModel _$NFTModelFromJson(Map<String, dynamic> json) {
  return NFTModel(
    tokenAddress: json['tokenAddress'] as String,
    tokenId: json['tokenId'] as String,
    name: json['name'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    collectionName: json['collectionName'] as String?,
    contractType: json['contractType'] as String?,
  );
}

/// @nodoc
mixin _$NFTModel {
  String get tokenAddress => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get collectionName => throw _privateConstructorUsedError;
  String? get contractType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTModelCopyWith<NFTModel> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $NFTModelCopyWith<$Res> {
  factory $NFTModelCopyWith(NFTModel value, $Res Function(NFTModel) then) =
      _$NFTModelCopyWithImpl<$Res, NFTModel>;
  @useResult
  $Res call(
      {String tokenAddress,
      String tokenId,
      String? name,
      String? description,
      String? imageUrl,
      String? collectionName,
      String? contractType});
}

class _$NFTModelCopyWithImpl<$Res, $Val extends NFTModel>
    implements $NFTModelCopyWith<$Res> {
  _$NFTModelCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenAddress = null,
    Object? tokenId = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? collectionName = freezed,
    Object? contractType = freezed,
  }) {
    return _then(_value.copyWith(
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress as String,
      tokenId: null == tokenId ? _value.tokenId : tokenId as String,
      name: freezed == name ? _value.name : name as String?,
      description:
          freezed == description ? _value.description : description as String?,
      imageUrl: freezed == imageUrl ? _value.imageUrl : imageUrl as String?,
      collectionName: freezed == collectionName
          ? _value.collectionName
          : collectionName as String?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType as String?,
    ) as $Val);
  }
}

abstract class _$$NFTModelImplCopyWith<$Res> implements $NFTModelCopyWith<$Res> {
  factory _$$NFTModelImplCopyWith(
          _$NFTModelImpl value, $Res Function(_$NFTModelImpl) then) =
      __$$NFTModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tokenAddress,
      String tokenId,
      String? name,
      String? description,
      String? imageUrl,
      String? collectionName,
      String? contractType});
}

class __$$NFTModelImplCopyWithImpl<$Res>
    extends _$NFTModelCopyWithImpl<$Res, _$NFTModelImpl>
    implements _$$NFTModelImplCopyWith<$Res> {
  __$$NFTModelImplCopyWithImpl(
      _$NFTModelImpl _value, $Res Function(_$NFTModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenAddress = null,
    Object? tokenId = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? collectionName = freezed,
    Object? contractType = freezed,
  }) {
    return _then(_$NFTModelImpl(
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress as String,
      tokenId: null == tokenId ? _value.tokenId : tokenId as String,
      name: freezed == name ? _value.name : name as String?,
      description:
          freezed == description ? _value.description : description as String?,
      imageUrl: freezed == imageUrl ? _value.imageUrl : imageUrl as String?,
      collectionName: freezed == collectionName
          ? _value.collectionName
          : collectionName as String?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType as String?,
    ));
  }
}

class _$NFTModelImpl extends _NFTModel {
  const _$NFTModelImpl(
      {required this.tokenAddress,
      required this.tokenId,
      this.name,
      this.description,
      this.imageUrl,
      this.collectionName,
      this.contractType})
      : super._();

  factory _$NFTModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTModelImplFromJson(json);

  @override
  final String tokenAddress;
  @override
  final String tokenId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? collectionName;
  @override
  final String? contractType;

  @override
  String toString() {
    return 'NFTModel(tokenAddress: $tokenAddress, tokenId: $tokenId, name: $name, description: $description, imageUrl: $imageUrl, collectionName: $collectionName, contractType: $contractType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTModelImpl &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.contractType, contractType) ||
                other.contractType == contractType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tokenAddress, tokenId, name,
      description, imageUrl, collectionName, contractType);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTModelImplCopyWith<_$NFTModelImpl> get copyWith =>
      __$$NFTModelImplCopyWithImpl<_$NFTModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTModelImplToJson(this);
  }
}

abstract class _NFTModel extends NFTModel {
  const factory _NFTModel(
      {required final String tokenAddress,
      required final String tokenId,
      final String? name,
      final String? description,
      final String? imageUrl,
      final String? collectionName,
      final String? contractType}) = _$NFTModelImpl;
  const _NFTModel._() : super._();

  factory _NFTModel.fromJson(Map<String, dynamic> json) =
      _$NFTModelImpl.fromJson;

  @override
  String get tokenAddress;
  @override
  String get tokenId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String? get collectionName;
  @override
  String? get contractType;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTModelImplCopyWith<_$NFTModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Map<String, dynamic> _$$NFTModelImplToJson(_$NFTModelImpl instance) =>
    <String, dynamic>{
      'tokenAddress': instance.tokenAddress,
      'tokenId': instance.tokenId,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'collectionName': instance.collectionName,
      'contractType': instance.contractType,
    };

Map<String, dynamic> _$$NFTModelImplFromJson(Map<String, dynamic> json) =>
    _$NFTModelFromJson(json);

/// MoralisBalanceResponse freezed implementation
mixin _$MoralisBalanceResponse {
  String get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoralisBalanceResponseCopyWith<MoralisBalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $MoralisBalanceResponseCopyWith<$Res> {
  factory $MoralisBalanceResponseCopyWith(MoralisBalanceResponse value,
          $Res Function(MoralisBalanceResponse) then) =
      _$MoralisBalanceResponseCopyWithImpl<$Res, MoralisBalanceResponse>;
  @useResult
  $Res call({String balance});
}

class _$MoralisBalanceResponseCopyWithImpl<$Res,
        $Val extends MoralisBalanceResponse>
    implements $MoralisBalanceResponseCopyWith<$Res> {
  _$MoralisBalanceResponseCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? balance = null}) {
    return _then(_value.copyWith(
      balance: null == balance ? _value.balance : balance as String,
    ) as $Val);
  }
}

abstract class _$$MoralisBalanceResponseImplCopyWith<$Res>
    implements $MoralisBalanceResponseCopyWith<$Res> {
  factory _$$MoralisBalanceResponseImplCopyWith(
          _$MoralisBalanceResponseImpl value,
          $Res Function(_$MoralisBalanceResponseImpl) then) =
      __$$MoralisBalanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String balance});
}

class __$$MoralisBalanceResponseImplCopyWithImpl<$Res>
    extends _$MoralisBalanceResponseCopyWithImpl<$Res,
        _$MoralisBalanceResponseImpl>
    implements _$$MoralisBalanceResponseImplCopyWith<$Res> {
  __$$MoralisBalanceResponseImplCopyWithImpl(
      _$MoralisBalanceResponseImpl _value,
      $Res Function(_$MoralisBalanceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? balance = null}) {
    return _then(_$MoralisBalanceResponseImpl(
      balance: null == balance ? _value.balance : balance as String,
    ));
  }
}

class _$MoralisBalanceResponseImpl extends _MoralisBalanceResponse {
  const _$MoralisBalanceResponseImpl({required this.balance}) : super._();

  factory _$MoralisBalanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoralisBalanceResponseImplFromJson(json);

  @override
  final String balance;

  @override
  String toString() => 'MoralisBalanceResponse(balance: $balance)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoralisBalanceResponseImpl &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoralisBalanceResponseImplCopyWith<_$MoralisBalanceResponseImpl>
      get copyWith => __$$MoralisBalanceResponseImplCopyWithImpl<
          _$MoralisBalanceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoralisBalanceResponseImplToJson(this);
  }
}

abstract class _MoralisBalanceResponse extends MoralisBalanceResponse {
  const factory _MoralisBalanceResponse({required final String balance}) =
      _$MoralisBalanceResponseImpl;
  const _MoralisBalanceResponse._() : super._();

  factory _MoralisBalanceResponse.fromJson(Map<String, dynamic> json) =
      _$MoralisBalanceResponseImpl.fromJson;

  @override
  String get balance;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoralisBalanceResponseImplCopyWith<_$MoralisBalanceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Map<String, dynamic> _$$MoralisBalanceResponseImplToJson(
        _$MoralisBalanceResponseImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
    };

Map<String, dynamic> _$$MoralisBalanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MoralisBalanceResponseFromJson(json);

MoralisBalanceResponse _$MoralisBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return MoralisBalanceResponse(
    balance: json['balance'] as String,
  );
}
