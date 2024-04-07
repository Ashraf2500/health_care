import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class BookAppointmentInfo extends StatelessWidget {
  const BookAppointmentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: CustomBackAppBar(
        context: context,
        title: "Book an Appointment",
      ),
      body: SingleChildScrollView(
        child: Container(
          height:   FixedVariables.heightScreenQuery(context)*0.91,
          padding:  EdgeInsets.symmetric(horizontal: FixedVariables.widthScreenQuery(context)*0.06),
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
                textStyle: TextStyleHelper.style12B,
                heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)*0.01,
              ),
              CustomTextFormField(
                labelText: "Phone",
                enableBorder: false,
                textStyle: TextStyleHelper.style12R,
                heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)*0.01,
              ),
              CustomTextFormField(
                labelText: "Age",
                enableBorder: false,
                textStyle: TextStyleHelper.style12R,
                heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)*0.01,
              ),
              CustomTextFormField(
                labelText: "Gender",
                enableBorder: false,
                textStyle: TextStyleHelper.style12R,
                heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)*0.01,
              ),
              CustomTextFormField(
                labelText: "City",
                enableBorder: false,
                textStyle: TextStyleHelper.style12R,
                heightFilled: FixedVariables.heightScreenQuery(context)*0.1,
              ),
              SizedBox(
                height: FixedVariables.heightScreenQuery(context)*0.01,
              ),
              CustomTextFormField(
                labelText: "Describe your Problem (option)",
                enableBorder: false,
                textStyle: TextStyleHelper.style12R,
                heightFilled: FixedVariables.heightScreenQuery(context)*0.14,
                maxLines: 3,
              ),
              Spacer(),
              Container(
                height: FixedVariables.heightScreenQuery(context)*0.12,
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
                  top: FixedVariables.heightScreenQuery(context) * 0.04,
                  bottom: FixedVariables.heightScreenQuery(context) * 0.02,
                ),
                child: CustomButton(
                  onPressed: (){
                    RoutingHelper.navToBookAppointmentInfo(context);
                  },
                  text: "Confirm",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
