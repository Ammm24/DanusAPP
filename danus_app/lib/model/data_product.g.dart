// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProduct _$DataProductFromJson(Map<String, dynamic> json) => DataProduct(
      id: json['id'],
      name: json['name'],
      ukuran: json['ukuran'],
      stok: json['stok'],
      description: json['description'],
      price: json['price'],
      picturePath: json['picturePath'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$DataProductToJson(DataProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ukuran': instance.ukuran,
      'stok': instance.stok,
      'description': instance.description,
      'price': instance.price,
      'picturePath': instance.picturePath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
