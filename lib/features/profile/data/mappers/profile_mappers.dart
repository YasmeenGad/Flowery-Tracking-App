import 'package:flowery_delivery/features/profile/data/models/response/get_all_vehicles_dto.dart';
import 'package:flowery_delivery/features/profile/domain/entities/response/get_all_vehicles_entity.dart';

import '../../domain/entities/request/change_password_request_entity.dart';
import '../../domain/entities/response/change_password_response_entity.dart';
import '../../domain/entities/response/edit_profile_response_entity.dart';
import '../../domain/entities/response/get_logged_user_driver_response_entity.dart';
import '../../domain/entities/response/upload_photo_response_entity.dart';
import '../models/request/change_password_request_dto.dart';
import '../models/response/change_password_response_dto.dart';
import '../models/response/edit_profile_response_dto.dart';
import '../models/response/get_logged_driver_data_response_dto.dart';
import '../models/response/upload_photo_response_dto.dart';

class ProfileMapper {
  static GetLoggedDriverDataResponseEntity getLoggedResponseToEntity(
      GetLoggedDriverDataResponseDto dto) {
    return GetLoggedDriverDataResponseEntity(
      message: dto.message,
      driver: dto.driver != null
        ? DriverEntity(
          country: dto.driver?.country,
          firstName: dto.driver?.firstName,
          id: dto.driver?.id,
          lastName: dto.driver?.lastName,
          vehicleType: dto.driver?.vehicleType,
          vehicleNumber: dto.driver?.vehicleNumber,
          vehicleLicense: dto.driver?.vehicleLicense,
         nid: dto.driver?.nID,
          nIDImg: dto.driver?.nIDImg,
          email: dto.driver?.email,
          gender: dto.driver?.gender,
          phone: dto.driver?.phone,
          photo: dto.driver?.photo,
          createdAt: dto.driver?.createdAt,
        ) : null,
    );
  }

  static EditProfileResponseEntity editProfileResponseToEntity(
      EditProfileResponseDto dto) {
    return EditProfileResponseEntity(
      driver: editProfileToUserEntity(dto.driver!),
    );
  }

  static EditProfileResponseUserEntity editProfileToUserEntity(
      EditProfileResponseDtoUser dto) {
    return EditProfileResponseUserEntity(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
      password: dto.password,
      gender: dto.gender,
      phone: dto.phone,
      photo: dto.photo,
      role: dto.role,
      createdAt: dto.createdAt,
      country: dto.country,
      vehicleType: dto.vehicleType,
      vehicleNumber: dto.vehicleNumber,
      vehicleLicense: dto.vehicleLicense,
      nid: dto.nID,
      nIDImg: dto.nIDImg,
    );
  }

  static UploadPhotoResponseEntity uploadPhotoResponseToEntity(
      UploadPhotoResponseDto dto) {
    return UploadPhotoResponseEntity(message: dto.message);
  }

  static ChangePasswordResponseEntity toPasswordResponseEntity(
      ChangePasswordResponseDto dto) {
    return ChangePasswordResponseEntity(token: dto.token);
  }

  static ChangePasswordRequestDto toPasswordRequestDto(
      ChangePasswordRequestEntity entity) {
    return ChangePasswordRequestDto(entity.password, entity.newPassword);
  }

  static GetAllVehiclesEntity getAllVehiclesResponseToEntity(
      GetAllVehiclesDto dto) {
    return GetAllVehiclesEntity(
      message: dto.message,
      metadata: dto.metadata != null
          ? Metadata(
              currentPage: dto.metadata?.currentPage,
              numberOfPages: dto.metadata?.numberOfPages,
              limit: dto.metadata?.limit,
            )
          : null,
      vehicles: dto.vehicles?.map((vehicleDto) {
        return Vehicles(
          id: vehicleDto.id,
          type: vehicleDto.type,
          image: vehicleDto.image,
          createdAt: vehicleDto.createdAt,
          updatedAt: vehicleDto.updatedAt,
          v: vehicleDto.v,
        );
      }).toList(),
    );
  }
}
