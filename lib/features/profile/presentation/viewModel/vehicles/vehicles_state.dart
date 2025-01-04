part of 'vehicles_cubit.dart';

sealed class VehiclesState {}

final class VehiclesInitial extends VehiclesState {}

final class GetVehiclesLoading extends VehiclesState {}

final class GetVehiclesSuccess extends VehiclesState {
  final GetAllVehiclesEntity data;

  GetVehiclesSuccess({required this.data});
}

final class GetVehiclesError extends VehiclesState {
  final ErrorModel error;

  GetVehiclesError({required this.error});
}
