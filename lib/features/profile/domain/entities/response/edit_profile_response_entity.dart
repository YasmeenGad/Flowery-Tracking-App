import 'package:equatable/equatable.dart';

class EditProfileResponseEntity extends Equatable {
  final EditProfileResponseUserEntity? driver;

  const EditProfileResponseEntity({this.driver});

  @override
  List<Object?> get props => [driver];
}

class EditProfileResponseUserEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? country;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  final String? nid;
  final String? nIDImg;
  final String? createdAt;

  const EditProfileResponseUserEntity({
    this.country,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.createdAt,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        password,
        gender,
        phone,
        photo,
        role,
        country,
        vehicleType,
        vehicleNumber,
        vehicleLicense,
        nid,
        nIDImg,
        createdAt
      ];
}
