import 'dart:io';

import '../../../domain/entities/request/change_password_request_entity.dart';

sealed class EditProfileActions {}
class EditProfile extends EditProfileActions {
  final Map<String, dynamic> profileData;

  EditProfile(this.profileData);
}
class ChangePassword extends EditProfileActions {

  final ChangePasswordRequestEntity request;
  ChangePassword({required this.request});
}

class UploadPhoto extends EditProfileActions {
  final File photo;

  UploadPhoto(this.photo);
}