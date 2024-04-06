import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class DoctorInfoBody extends StatelessWidget {
  DoctorInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return BlocBuilder<GetDoctorInfoCubit, GetDoctorInfoState>(
      builder: (context, state) {
        if(state is GitDoctorInfoChanged){
          int index =  state.index ;
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _widthScreen * 0.04, vertical: _heightScreen * 0.04),
            child: Card(
              elevation: 0.8,
              child: Container(
                height: _heightScreen,
                width: _widthScreen,
                padding: EdgeInsets.symmetric(
                    horizontal: _widthScreen * 0.06,
                    vertical: _heightScreen * 0.04),
                decoration: BoxDecoration(
                  color: ColorHelper.whiteColor,
                  borderRadius: BorderRadius.circular(FixedVariables.radius12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: _heightScreen * 0.13,
                          width: _widthScreen * 0.26,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(FixedVariables.radius12),
                            image: DecorationImage(
                              image: AssetImage(
                                "${listOfPopularDoctors[index].image}",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _widthScreen * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: _widthScreen*0.45,
                              child: Text(
                                "${listOfPopularDoctors[index].name}",
                                style: TextStyleHelper.style14B,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "${listOfPopularDoctors[index].specialist}",
                              style: TextStyleHelper.style12B
                                  .copyWith(color: ColorHelper.mainColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${listOfPopularDoctors[index].Experience}",
                              style: TextStyleHelper.style12R.copyWith(color: ColorHelper.grayText),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: _heightScreen * 0.02,
                            ),
                            RatingBar.builder(
                              initialRating: listOfPopularDoctors[index].evaluate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 18,
                              ignoreGestures: true,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              unratedColor: ColorHelper.noActiveStar,
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
                      ],
                    ),
                    SizedBox(
                      height: _heightScreen * 0.05,
                    ),
                    Text(
                      "Schedule",
                      style: TextStyleHelper.style18B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.02,
                    ),
                    Text(
                      "Thursday: 10Am : 3PM ",
                      style: TextStyleHelper.style14M
                          .copyWith(color: ColorHelper.grayText),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    Text(
                      "Thursday: 10Am : 3PM ",
                      style: TextStyleHelper.style14M
                          .copyWith(color: ColorHelper.grayText),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    Text(
                      "Thursday: 10Am : 3PM ",
                      style: TextStyleHelper.style14M
                          .copyWith(color: ColorHelper.grayText),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.05,
                    ),
                    Text(
                      "Evaluate doctor",
                      style: TextStyleHelper.style18B
                          .copyWith(color: ColorHelper.mainColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: _heightScreen * 0.01,
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      ignoreGestures: false,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0),
                      unratedColor: ColorHelper.noActiveStar,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: ColorHelper.activeStar,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Spacer(),
                    CustomButton(
                      onPressed: () {
                        RoutingHelper.navToBookAppointmentTime(context);
                      },
                      text: "Book Now",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
