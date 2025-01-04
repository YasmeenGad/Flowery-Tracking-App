import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto {
  final String? message;
  final EditProfileResponseDtoUser? driver;

  EditProfileResponseDto(this.message, this.driver);

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoToJson(this);
}

@JsonSerializable()
class EditProfileResponseDtoUser {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? createdAt;
  final String? country;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  @JsonKey(name: "NID")
  final String? nID;
  @JsonKey(name: "NIDImg")
  final String? nIDImg;

  EditProfileResponseDtoUser(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
    this.country,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nID,
    this.nIDImg,
  );

  factory EditProfileResponseDtoUser.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoUserFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoUserToJson(this);
}
