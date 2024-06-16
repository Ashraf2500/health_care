part of 'report_medicine_details_cubit.dart';

@immutable
abstract class ReportMedicineDetailsState {}


class ReportMedicineDetailsInitial extends ReportMedicineDetailsState {
  final ReportMedicineDetailsStatus status;
  List<String>? listOfMedicine = [];
  List<String>? listOfMedicineDetails = [];
  ReportMedicineDetailsInitial({
    required this.status,
    required this.listOfMedicine,
    required this.listOfMedicineDetails,

  });
}
