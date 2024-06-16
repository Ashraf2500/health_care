
 List<String> _listOfDepartmentOfDoctorType=[
  'Dentist',
  'Cardiology',
  'Orthopedics',
  'Ophthalmology',
  'Dermatology',
  'Internal Medicine',
  'Obstetrics & Gynecology',
  'Pediatrics',
  'Pulmonology',
  'Urology'
];

String checkDepartmentOfDoctorFunc({ int? departmentId}){
  if(departmentId==null){
    return 'specialist Unknown';

  }
  else if(departmentId <= _listOfDepartmentOfDoctorType.length){
    return _listOfDepartmentOfDoctorType[departmentId];;
  }
  else{
    return 'specialist Unknown';
  }


}