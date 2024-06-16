import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

const List<String> listMedicalTypes = <String>[
  'dentist',
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

class CreateDoctorAccount extends StatefulWidget {
  const CreateDoctorAccount({Key? key}) : super(key: key);

  @override
  State<CreateDoctorAccount> createState() => _CreateDoctorAccountState();
}

class _CreateDoctorAccountState extends State<CreateDoctorAccount> {
  late TextEditingController nameEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController confirmPasswordEditingController;
  late TextEditingController specialityEditingController;
  late TextEditingController expertmentEditingController;

  String dropdownValue = listMedicalTypes.first;
  int speciality =0;

  @override
  void initState() {
    nameEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    confirmPasswordEditingController = TextEditingController();
    specialityEditingController = TextEditingController();
    expertmentEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    phoneEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    specialityEditingController.dispose();
    expertmentEditingController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> signUpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomBackAppBar(
        context: context,
        title: "Add Doctor",
        titleColor: ColorHelper.whiteColor,
        backgroundColor: ColorHelper.mainColor,
        arrowColor: ColorHelper.whiteColor,
        elevation: 3.5,
        shadowColor: ColorHelper.mainColor,
        appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: _heightScreen*0.9,
          child: BlocBuilder<CreateDoctorCubit, CreateDoctorState>(
            builder: (context, state) {
              CreateDoctorCubit createDoctor =
                  context.read<CreateDoctorCubit>();
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        FixedVariables.widthScreenQuery(context) * 0.06),
                    child: Form(
                      key: createDoctor.createDoctorFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _heightScreen * 0.00,
                          ),
                          Row(
                            children: [
                              Text(
                                "Create",
                                style: TextStyleHelper.style20B,
                              ),
                              Text(
                                " Account !",
                                style: TextStyleHelper.style20B
                                    .copyWith(color: ColorHelper.mainColor),
                              ),
                            ],
                          ),
                          Text(
                            "Doctor",
                            style: TextStyleHelper.style14B.copyWith(
                                color: ColorHelper.blackColor.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: _heightScreen * 0.01,
                          ),
                          CustomTextFormField(
                            controller: nameEditingController,
                            hintText: "Full name",
                            marginVerticalSides: _heightScreen * 0.018,
                            borderColor:
                                ColorHelper.blackColor.withOpacity(0.5),
                            heightFilled: createDoctor.heightFilledName,
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: ColorHelper.blackColor.withOpacity(0.6),
                            ),
                            validation: (value) {
                              return createDoctor.nameValidation(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: phoneEditingController,
                            hintText: "Phone",
                            //marginVerticalSides: _heightScreen * 0.01,
                            keyboardType: TextInputType.phone,
                            borderColor:
                                ColorHelper.blackColor.withOpacity(0.5),
                            heightFilled: createDoctor.heightFilledPhone,
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: ColorHelper.blackColor.withOpacity(0.6),
                            ),
                            validation: (value) {
                              return createDoctor.phoneValidation(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: expertmentEditingController,
                            hintText: "Experience",
                            marginVerticalSides: _heightScreen * 0.018,
                            keyboardType: TextInputType.number,
                            borderColor:
                                ColorHelper.blackColor.withOpacity(0.5),
                            heightFilled: createDoctor.heightFilledExpertment,
                            prefixIcon: Icon(
                              Icons.bar_chart_rounded,
                              color: ColorHelper.blackColor.withOpacity(0.6),
                            ),
                            validation: (value) {
                              return createDoctor.expertmentValidation(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: passwordEditingController,
                            hintText: "Password",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.visibility_rounded,
                                size: 22,
                                color: ColorHelper.grayText.withOpacity(0.8),
                              ),
                            ),
                            //marginVerticalSides: _heightScreen * 0.018,
                            borderColor:
                                ColorHelper.blackColor.withOpacity(0.5),
                            heightFilled: createDoctor.heightFilledPassword,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: ColorHelper.blackColor.withOpacity(0.6),
                            ),
                            validation: (value) {
                              return createDoctor.passwordValidation(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: confirmPasswordEditingController,
                            hintText: "Confirm Password",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.visibility_rounded,
                                size: 22,
                                color: ColorHelper.grayText.withOpacity(0.8),
                              ),
                            ),
                            marginVerticalSides: _heightScreen * 0.018,
                            borderColor: ColorHelper.blackColor.withOpacity(0.5),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: ColorHelper.blackColor.withOpacity(0.6),
                            ),
                            heightFilled: createDoctor.heightFilledConfirmPassword,
                            validation: (value) {
                              return createDoctor.confirmPasswordValidation(
                                  value, passwordEditingController.text);
                            },
                          ),
                          // CustomTextFormField(
                          //   controller: specialityEditingController,
                          //   hintText: "Speciality",
                          //   marginVerticalSides: _heightScreen * 0.018,
                          //   borderColor: ColorHelper.blackColor.withOpacity(0.5),
                          //   heightFilled: createDoctor.heightFilledSpeciality,
                          //   prefixIcon: Icon(
                          //     Icons.perm_contact_cal_outlined,
                          //     color: ColorHelper.blackColor.withOpacity(0.6),
                          //   ),
                          //   validation: (value) {
                          //     return createDoctor.specialityValidation(value);
                          //   },
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Speciality",
                                style: TextStyleHelper.style12B.copyWith(color: ColorHelper.grayText),
                              ),
                              Container(
                                width: FixedVariables.widthScreenQuery(context)*0.64,
                                padding: EdgeInsets.only(
                                  left: FixedVariables.widthScreenQuery(context)*0.04,
                                  right: FixedVariables.widthScreenQuery(context)*0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorHelper.gray100,
                                  border: Border.all(
                                    color:  ColorHelper.blackColor.withOpacity(0.5)
                                  ),
                                  borderRadius: BorderRadius.circular(FixedVariables.radius8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _specialityDropdown(),
                                    Icon(Icons.arrow_drop_down_outlined),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Spacer(),
                          CustomButton(
                            onPressed: () {
                              createDoctor.createDoctor(
                                context: context,
                                fullName: nameEditingController.text,
                                phone: phoneEditingController.text,
                                password: passwordEditingController.text,
                                confirmPassword: confirmPasswordEditingController.text,
                                speciality: speciality,
                                //todo
                                expertment: expertmentEditingController.text,
                              );
                            },
                            text: "Create",
                          ),
                          SizedBox(
                            height: _heightScreen * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                  (state is LoadingCreateDoctorState)
                      ? Container(
                          height: _heightScreen,
                          color: ColorHelper.blackColor.withOpacity(0.3),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  DropdownButton<String> _specialityDropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style:  TextStyleHelper.style12M.copyWith(color: ColorHelper.blackColor),
      iconSize: 0,
      menuMaxHeight: FixedVariables.heightScreenQuery(context)*0.4,
      underline: Container(
        height: 0,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          speciality = listMedicalTypes.indexOf(value);
          print(speciality);
        });
      },
      items: listMedicalTypes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

/// Flutter code sample for [DropdownButton].
