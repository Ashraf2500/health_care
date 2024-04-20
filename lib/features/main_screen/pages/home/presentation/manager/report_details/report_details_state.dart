part of 'report_details_cubit.dart';

@immutable
abstract class ReportDetailsState {}

class ReportDetailsInitial extends ReportDetailsState {
  final ReportDetailsStatus status;
  String? diagnosisDetails = "";
  String? reasonsDetails = "";
  String? advicesDetails = "";
  String? treatmentDetails = "";
  List<String>? listOfMedicine = [];
  List<String>? listOfMedicineDetails = [];
  ReportDetailsInitial({
    required this.status,
    required this.diagnosisDetails,
    required this.reasonsDetails,
    required this.advicesDetails,
    required this.treatmentDetails,
    required this.listOfMedicine,
    required this.listOfMedicineDetails,

  });
}