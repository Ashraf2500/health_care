import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';
part 'create_Medicine_state.dart';

class CreateMedicineCubit extends Cubit<CreateMedicineState> {
  CreateMedicineCubit() : super(CreateMedicineInitial());

  List<MedicineModel> lisOfMedicine = [];

  void addMedicine ({required MedicineModel medicine}){
    lisOfMedicine.add(medicine);
    emit(CreateMedicineChanged());
  }
  void deleteMedicine ({required MedicineModel medicine}){
    lisOfMedicine.remove(medicine);
    emit(CreateMedicineChanged());
  }
}
