import 'package:json_annotation/json_annotation.dart';

part 'get_all_vehicles_dto.g.dart';

@JsonSerializable()
class GetAllVehiclesDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "vehicles")
  final List<VehiclesDto>? vehicles;

  GetAllVehiclesDto ({
    this.message,
    this.metadata,
    this.vehicles,
  });

  factory GetAllVehiclesDto.fromJson(Map<String, dynamic> json) {
    return _$GetAllVehiclesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllVehiclesDtoToJson(this);
  }
}

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  MetadataDto ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDtoToJson(this);
  }
}

@JsonSerializable()
class VehiclesDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  VehiclesDto ({
    this.id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory VehiclesDto.fromJson(Map<String, dynamic> json) {
    return _$VehiclesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehiclesDtoToJson(this);
  }
}


