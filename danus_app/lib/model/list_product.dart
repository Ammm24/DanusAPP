import 'package:danus_app/model/data_product.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_product.g.dart';

@JsonSerializable()
class ListProduct extends Equatable {
  @JsonKey(name: 'current_page')
  final dynamic currentPage;
  final List<DataProduct>? data;

  const ListProduct({this.currentPage, this.data});

  factory ListProduct.fromJson(Map<String, dynamic> json) =>
      _$ListProductFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductToJson(this);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [data, currentPage];
}
