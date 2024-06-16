import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class BookAppointmentInfo extends StatefulWidget {
  const BookAppointmentInfo({Key? key}) : super(key: key);

  @override
  State<BookAppointmentInfo> createState() => _BookAppointmentInfoState();
}

class _BookAppointmentInfoState extends State<BookAppointmentInfo> {

  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _ageEditingController = TextEditingController();
  TextEditingController _cityEditingController = TextEditingController();
  TextEditingController _descEditingController = TextEditingController();

  int? gender ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAppointmentCubit,CreateAppointmentState>(
      builder: (context,appointmentState) {
        CreateAppointmentCubit _appointmentCubitData = context.read<CreateAppointmentCubit>();
        return Stack(
          children: [
            Scaffold(
              //resizeToAvoidBottomInset: false,
              appBar: CustomBackAppBar(
                context: context,
                title: "Book Appointment",
                titleColor: ColorHelper.whiteColor,
                backgroundColor: ColorHelper.mainColor,
                arrowColor: ColorHelper.whiteColor,
                elevation: 4,
                shadowColor: ColorHelper.mainColor,
                appBarHeight: FixedVariables.heightScreenQuery(context) * 0.07,
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.06),
                  child: Form(
                    key: _appointmentCubitData.createAppointmentFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context) * 0.04,
                        ),
                        Text(
                          "Set Information",
                          style: TextStyleHelper.style14B,
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context) * 0.02,
                        ),
                        CustomTextFormField(
                          labelText: "Name",
                          enableBorder: false,
                          controller: _nameEditingController,
                          validation:(value){
                            return _appointmentCubitData.nameValidation(value);
                          },
                          textStyle: TextStyleHelper.style12B,
                          heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context)*0.01,
                        ),
                        CustomTextFormField(
                          labelText: "Phone",
                          enableBorder: false,
                          controller: _phoneEditingController,
                          validation:(value){
                            return _appointmentCubitData.phoneValidation(value);
                          },
                          keyboardType: TextInputType.number,
                          textStyle: TextStyleHelper.style12B,
                          heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context)*0.01,
                        ),
                        CustomTextFormField(
                          labelText: "Age",
                          enableBorder: false,
                          controller: _ageEditingController,
                          validation:(value){
                            return _appointmentCubitData.ageValidation(value);
                          },
                          keyboardType: TextInputType.number,
                          textStyle: TextStyleHelper.style12B,
                          heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context)*0.01,
                        ),
                        CustomTextFormField(
                          labelText: "City",
                          enableBorder: false,
                          controller: _cityEditingController,
                          validation:(value){
                            return _appointmentCubitData.cityValidation(value);
                          },
                          textStyle: TextStyleHelper.style12B,
                          heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context)*0.01,
                        ),

                        CustomTextFormField(
                          labelText: "Describe your Problem (option)",
                          enableBorder: false,
                          controller: _descEditingController,
                          textStyle: TextStyleHelper.style12R,
                          heightFilled: FixedVariables.heightScreenQuery(context)*0.14,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context)*0.01,
                        ),
                        Container(
                          height:  FixedVariables.heightScreenQuery(context)*0.1,
                          width:  FixedVariables.widthScreenQuery(context),
                          padding: EdgeInsets.only(
                            left:  FixedVariables.widthScreenQuery(context)*0.06,
                            right:  FixedVariables.widthScreenQuery(context)*0.06,
                            top:  FixedVariables.heightScreenQuery(context)*0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0x0A000000),
                            borderRadius: BorderRadius.circular(FixedVariables.radius4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: TextStyleHelper.style12B.copyWith(color:ColorHelper.mainColor),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: FixedVariables.widthScreenQuery(context)*0.02,
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Radio(
                                      value:1,
                                      groupValue: gender,
                                        fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                                          if (states.contains(MaterialState.disabled)) {
                                            return ColorHelper.mainColor;
                                          }
                                          return ColorHelper.mainColor;
                                        }),
                                      onChanged: (value){
                                        setState(() {
                                          gender = value;
                                        });
                                      }
                                    ),
                                  ),
                                  Text(
                                    "Male",
                                    style:TextStyleHelper.style10B.copyWith(color:ColorHelper.grayText),
                                  ),
                                  Spacer(),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Radio(
                                        value: 2,
                                        groupValue: gender,
                                        fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                                          if (states.contains(MaterialState.disabled)) {
                                            return ColorHelper.mainColor;
                                          }
                                          return ColorHelper.mainColor;
                                        }),
                                        onChanged: (value){
                                          setState(() {
                                            gender = value;
                                          });
                                        }


                                    ),
                                  ),
                                  Text(
                                    "Female",
                                    style:TextStyleHelper.style10B.copyWith(color:ColorHelper.grayText),
                                  ),
                                  SizedBox(
                                    width: FixedVariables.widthScreenQuery(context)*0.04,
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: FixedVariables.heightScreenQuery(context)*0.01,
                        ),
                        Container(
                          height: FixedVariables.heightScreenQuery(context)*0.1,
                          width: FixedVariables.widthScreenQuery(context),
                         // width: FixedVariables.widthScreenQuery(context)*0.35,
                          //margin: EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.03,),
                          decoration: BoxDecoration(
                            color: ColorHelper.mainShadow.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(FixedVariables.radius16),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_rounded,color: ColorHelper.mainColor,),
                                SizedBox(
                                  width: FixedVariables.widthScreenQuery(context)*0.01,
                                ),
                                Text(
                                  "upload photo (option)",
                                  style: TextStyleHelper.style10B.copyWith(color: ColorHelper.mainColor),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Container(
                        //   height: 120,
                        //   child: ListView.builder(
                        //     itemCount: 3,
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (context,index){
                        //         return Container(
                        //           width:FixedVariables.widthScreenQuery(context)*0.35,
                        //           margin: EdgeInsets.symmetric(horizontal: FixedVariables.heightScreenQuery(context)*0.002),
                        //           decoration: BoxDecoration(
                        //             color: Colors.yellow,
                        //             borderRadius: BorderRadius.circular(FixedVariables.radius8),
                        //             image: DecorationImage(
                        //               image: AssetImage(ImageHelper.chest_image),
                        //               fit: BoxFit.fill
                        //             ),
                        //           ),
                        //           //child: Image.asset(ImageHelper.chest_image),
                        //         );
                        //       }
                        //   ),
                        // ),

                        Padding(
                          padding:  EdgeInsets.only(
                            left: FixedVariables.widthScreenQuery(context)*0.02,
                            right: FixedVariables.widthScreenQuery(context)*0.02,
                            top: FixedVariables.heightScreenQuery(context) * 0.02,
                            bottom: FixedVariables.heightScreenQuery(context) * 0.04,
                          ),
                          child: CustomButton(
                            onPressed: (){
                              if(gender!=null){
                                context.read<CreateAppointmentCubit>().createAppointment(
                                  context: context,
                                  fullName: _nameEditingController.text,
                                  phone: _phoneEditingController.text,
                                  age: _ageEditingController.text,
                                  city: _cityEditingController.text,
                                  description: _descEditingController.text,
                                  gender: gender!,
                                  photos: "",
                                );
                              }else{
                                showSnackbar(context: context, message: "gender is required", backGroundColor: ColorHelper.redColor);
                              }
                            },
                            text: "Confirm",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            (appointmentState is LoadingCreateAppointmentState)
                ?Container(
                height: FixedVariables.heightScreenQuery(context),
                width: FixedVariables.widthScreenQuery(context),
                color: ColorHelper.blackColor.withOpacity(0.3),
                child: Center(child: CircularProgressIndicator()))
                :SizedBox(),
          ],
        );
      }
    );
  }
}
