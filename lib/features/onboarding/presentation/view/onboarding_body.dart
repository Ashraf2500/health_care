import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class OnboardingBody extends StatefulWidget {
   OnboardingBody({Key? key}) : super(key: key);

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
   int _currentOnboarding = 0;
  PageController _onboardingController = PageController(initialPage: 0);
  
  @override
  void initState() {
    _onboardingController;
    super.initState();
  }
  @override
  void dispose() {
    _onboardingController.dispose();
    super.dispose();
  }

   final List<OnboardingModel> _listOnboardingData = OnboardingData.PagesLottie;
  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen =  MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CustomBackgroundGradient(),
        Padding(
          padding:  EdgeInsets.all(
            FixedVariables.ScreenPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: _heightScreen*0.02,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed:(){
                    RoutingHelper.navToUserType(context);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyleHelper.style16S.copyWith(color: ColorHelper.mainColor),
                  ),

                ),
              ),

              // onboarding pages
              Expanded(
                child: PageView.builder(
                    controller: _onboardingController,
                    itemCount: OnboardingData.PagesLottie.length,
                    onPageChanged: (index){
                      setState(() {
                        _currentOnboarding = index;
                      });
                    },
                    itemBuilder: (context,index){
                      return CustomOnboardingItem(onboardingItem:_listOnboardingData[index]);
                    }
                ),
              ),

              // onboarding dots
              BuildOnboardingDots(currentOnboarding: _currentOnboarding),
              SizedBox(
                height: _heightScreen*0.04,
              ),

              // next button
              CustomButton(
                onPressed: (){
                  _onboardingController.nextPage(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeOut,
                  );
                  (_currentOnboarding==_listOnboardingData.length-1)?RoutingHelper.navToUserType(context):null;
                },
                text: (_currentOnboarding==_listOnboardingData.length-1)?"Join":"Next",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

