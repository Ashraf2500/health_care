import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomSliverAppBar extends StatelessWidget {
   CustomSliverAppBar({
    super.key,
  });

   UserType? _userType;
  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
     _userType = context.read<UserCubit>().userType;

    return BlocBuilder<HomeAppBarCubit, HomeAppBarState>(
      builder: (context, state) {
        if (state is ScrollHomeAppBarChanged) {
          bool _isMoved = state.isMoved;
          return SliverAppBar(
            backgroundColor: ColorHelper.mainColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.24,
            leading: SizedBox(),
            pinned: true,
            floating: true,
            toolbarHeight: _heightScreen * 0.047,
            collapsedHeight: _heightScreen * 0.0588,
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(0), // todo :: change the radius
              ),
            ),
            bottom: PreferredSize(
             preferredSize: Size.fromHeight(_heightScreen * 0.1175214),
              child: Transform.translate(
                offset: Offset(0, _heightScreen * 0.0235),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  //height:  50,
                  margin: EdgeInsets.only(
                      bottom: _isMoved ? _heightScreen * 0.02938 : 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(FixedVariables.radius8),
                      boxShadow: [
                        (_isMoved == false)
                            ? BoxShadow(
                                color: ColorHelper.boxShadow,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              )
                            : BoxShadow(),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: FixedVariables.homeTopContainerRadius,
                    ),
                    child: CustomTextFormField(
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorHelper.blackColor.withOpacity(0.7),
                        size: 25,
                      ),
                      hintText: "search ",
                      backgroundFilled: ColorHelper.backgroundSearchBar,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _heightScreen * 0.02,
                    horizontal: _widthScreen * 0.04),
                child: GestureDetector(
                  onTap: (){
                    RoutingHelper.navToUserType(context);
                  },
                  child: Icon(
                    Icons.notifications_none,
                    color: ColorHelper.whiteColor,
                    size: 26,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(20),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "Welcome To Health Care",
                    style: TextStyleHelper.style10R
                        .copyWith(color: ColorHelper.whiteColor),
                  ),
                  SizedBox(
                    height: _heightScreen * 0.01,
                  ),
                  Text(
                    (_userType ==UserType.patient)
                        ?"Find Your Doctor"
                        :(_userType ==UserType.doctor)
                        ?"Find Your Appointments"
                        :(_userType ==UserType.admin)
                        ?"Find Doctors' Appointments"
                        :"",
                    style: (_userType ==UserType.patient)?TextStyleHelper.style16M:TextStyleHelper.style12M,
                  ),
                  SizedBox(
                    height: _heightScreen * 0.06,
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
