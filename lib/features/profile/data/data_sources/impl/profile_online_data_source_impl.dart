import 'dart:io';
import 'package:flowery_delivery/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_delivery/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:flowery_delivery/features/profile/domain/entities/response/get_all_vehicles_entity.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../../../../../core/networking/api_execute.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/response/edit_profile_response_entity.dart';
import '../../../domain/entities/response/get_logged_user_driver_response_entity.dart';
import '../../../domain/entities/response/upload_photo_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../mappers/profile_mappers.dart';
import '../contracts/profile_online_data_source.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  ProfileOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<GetLoggedDriverDataResponseEntity>> getProfileData() {
    return executeApi(() async {
      var response = await _apiManager.getLoggedDriverData();
      return ProfileMapper.getLoggedResponseToEntity(response);
    });
  }

  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData) {
    return executeApi(() async {
      var response = await _apiManager.editProfile(profileData);
      return ProfileMapper.editProfileResponseToEntity(response);
    });
  }

  @override
  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) {
    return executeApi(() async {
      var response = await _apiManager.uploadPhoto(photo);
      return ProfileMapper.uploadPhotoResponseToEntity(response);
    });
  }

  @override
  Future<DataResult<GetAllVehiclesEntity>> getAllVehicles() {
    return executeApi(() async {
      var response = await _apiManager.getAllVehicles();
      return ProfileMapper.getAllVehiclesResponseToEntity(response);
    });
  }

  @override
  Future<DataResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity request) {
    return executeApi(() async {
      var response = await _apiManager.changePassword(ProfileMapper.toPasswordRequestDto(request));
      return ProfileMapper.toPasswordResponseEntity(response);
    });
  }
}
