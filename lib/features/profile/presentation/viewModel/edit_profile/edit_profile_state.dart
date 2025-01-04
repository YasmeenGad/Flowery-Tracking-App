part of 'edit_profile_cubit.dart';
@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final EditProfileResponseEntity data;

  EditProfileSuccess({required this.data});
}

final class EditProfileError extends EditProfileState {
  final ErrorModel error;

  EditProfileError({required this.error});
}

final class UploadPhotoLoading extends EditProfileState {}

final class ChangePasswordLoading extends EditProfileState {}

final class UploadPhotoSuccess extends EditProfileState {
  final UploadPhotoResponseEntity data;

  UploadPhotoSuccess({required this.data});
}

final class ChangePasswordSuccess extends EditProfileState {
  final ChangePasswordResponseEntity data;

  ChangePasswordSuccess({required this.data});
}

final class UploadPhotoError extends EditProfileState {
  final ErrorModel error;

  UploadPhotoError({required this.error});
}

final class ChangePasswordError extends EditProfileState {
  final ErrorModel error;

  ChangePasswordError({required this.error});
}
