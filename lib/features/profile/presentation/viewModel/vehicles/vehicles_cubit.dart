import 'package:bloc/bloc.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/vehicles/vehicles_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../../../core/networking/error/error_handler.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../domain/entities/response/get_all_vehicles_entity.dart';
import '../../../domain/use_cases/profile_use_case.dart';

part 'vehicles_state.dart';
@injectable
class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit(this._useCase) : super(VehiclesInitial());
  final ProfileUseCase _useCase;
final TextEditingController vehicleNumberController = TextEditingController();
final TextEditingController vehicleLicenseController = TextEditingController();
final TextEditingController vehicleTypeController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doAction(VehiclesActions action) {
    switch (action) {
      case GetAllVehicles():
        _getAllVehicles();


    }
  }
  List<Vehicles> vehicles = [];
  List<String> vehicleTypes = [];

  Future<void> _getAllVehicles() async {
    emit(GetVehiclesLoading());
    final result = await _useCase.getAllVehicles();
    switch (result) {
      case Success<GetAllVehiclesEntity>():
        vehicles = result.data.vehicles ?? [];
        vehicleTypes = vehicles.map((vehicle) => vehicle.type ?? '').toList();
        emit(GetVehiclesSuccess(data: result.data));
        break;
      case Fail<GetAllVehiclesEntity>():
        emit(GetVehiclesError(
            error: ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
