// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_vehicles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllVehiclesDto _$GetAllVehiclesDtoFromJson(Map<String, dynamic> json) =>
    GetAllVehiclesDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => VehiclesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllVehiclesDtoToJson(GetAllVehiclesDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'vehicles': instance.vehicles,
    };

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => MetadataDto(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataDtoToJson(MetadataDto instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

VehiclesDto _$VehiclesDtoFromJson(Map<String, dynamic> json) => VehiclesDto(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehiclesDtoToJson(VehiclesDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
