import 'package:flutter/material.dart';
import 'package:health_care/core/utils/check_department_of_doctor_func.dart';
import 'package:health_care/features/features_exports.dart';

class CustomPopularDoctorItem extends StatelessWidget {
   CustomPopularDoctorItem({
    Key? key,
    required this.index,
    required this.popularDoctors,
  }) : super(key: key);

  int index ;
  List<PopularDoctorsData> popularDoctors ;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){
          context.read<GetDoctorInfoCubit>().getDoctorInfo(index: index,popularDoctorsData: popularDoctors[index]);
          RoutingHelper.navToDoctorInfo(context);
          context.read<GetDoctorScheduleCubit>().getDoctorSchedule(context: context, doctorId:  popularDoctors[index].id??"");
        },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: ColorHelper.whiteColor,
              borderRadius: BorderRadius.circular(FixedVariables.radius16),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.shade300,
              //     spreadRadius: 0.5,
              //     blurRadius: 4,
              //     //offset: const Offset(0, 0)
              //   )
              // ]
          ),
          child: Column(
            children: [
              Container(
                height: _heightScreen*0.16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(FixedVariables.radius16)),
                  image: DecorationImage(
                    image: AssetImage(
                     // "${listOfPopularDoctors[index].image}",
                      "${ImageHelper.doctor_6}",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              SizedBox(
                height: _heightScreen * 0.02,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dr.${popularDoctors[index].name}",
                      //"${popularDoctors[index].name}",
                      style: TextStyleHelper.style10B,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${checkDepartmentOfDoctorFunc(departmentId: popularDoctors[index].speciality)}",
                      style: TextStyleHelper.style8R,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RatingBar.builder(
                      initialRating: (popularDoctors[index].ratingPoints==null)?0:popularDoctors[index].ratingPoints!.toDouble() ,
                      //initialRating: (popularDoctors[index]!.rating!=null)?((popularDoctors[index]!.rating)*1.0):0.0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      ignoreGestures: true,
                      unratedColor:  ColorHelper.noActiveStar,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: ColorHelper.activeStar,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _heightScreen * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
