import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_product.g.dart';

@JsonSerializable()
class DataProduct extends Equatable {
  final dynamic id;
  final dynamic name;
  final dynamic ukuran;
  final dynamic stok;
  final dynamic description;
  final dynamic price;
  final dynamic picturePath;
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;

  const DataProduct(
      {this.id,
      this.name,
      this.ukuran,
      this.stok,
      this.description,
      this.price,
      this.picturePath,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory DataProduct.fromJson(Map<String, dynamic> json) =>
      _$DataProductFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductToJson(this);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [id, name, ukuran, stok, price];
}
