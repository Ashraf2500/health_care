import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomPopularDoctorItem extends StatelessWidget {
   CustomPopularDoctorItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index ;

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: (){
          context.read<GetDoctorInfoCubit>().getDoctorInfo(index);
          RoutingHelper.navToDoctorInfo(context);
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
                      "${listOfPopularDoctors[index].image}",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              SizedBox(
                height: _heightScreen * 0.02,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${listOfPopularDoctors[index].name}",
                      style: TextStyleHelper.style10B,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${listOfPopularDoctors[index].specialist}",
                      style: TextStyleHelper.style8R,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RatingBar.builder(
                      initialRating: listOfPopularDoctors[index].evaluate,
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
