// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logged_driver_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedDriverDataResponseDto _$GetLoggedDriverDataResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetLoggedDriverDataResponseDto(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : DriverDto.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetLoggedDriverDataResponseDtoToJson(
        GetLoggedDriverDataResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
    };

DriverDto _$DriverDtoFromJson(Map<String, dynamic> json) => DriverDto(
      id: json['_id'] as String?,
      country: json['country'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      nID: json['NID'] as String?,
      nIDImg: json['NIDImg'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DriverDtoToJson(DriverDto instance) => <String, dynamic>{
      '_id': instance.id,
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.nID,
      'NIDImg': instance.nIDImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'createdAt': instance.createdAt,
    };
