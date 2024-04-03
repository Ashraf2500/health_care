class Category {
  String label;
  String image;
  bool userIsPatient;
  bool userIsDoctor;
  bool userIsAdmin;

  Category({
    required this.label,
    required this.image,
    required this.userIsPatient,
    required this.userIsDoctor,
    required this.userIsAdmin,
  });
}
