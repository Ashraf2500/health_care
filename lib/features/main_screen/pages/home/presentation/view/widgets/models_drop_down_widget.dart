import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class ModelsDropdownWidget extends StatefulWidget {
  const ModelsDropdownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDropdownWidget> createState() => _ModelsDropdownWidgetState();
}

class _ModelsDropdownWidgetState extends State<ModelsDropdownWidget> {

  String currentModel ="model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: List<DropdownMenuItem<String>>.generate(
          models.length,
          (index) => DropdownMenuItem(
            value: models[index],
            child: Text(
              models[index],
              style: TextStyleHelper.style14M,
            ),
          ),
        ),
        value: currentModel,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString() ;
          });
        });
  }
}
