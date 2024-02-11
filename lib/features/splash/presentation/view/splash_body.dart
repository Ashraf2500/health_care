import 'dart:async';
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addStatusListener(
          (status) async {
      /*  if (status == AnimationStatus.completed) {
          final token = await CacheHelper.getData(key: "token");
          final finger = await CacheHelper.getData(key: "finger");


          if (finger == "true") {
            FingerPrint().authAuth(context);
          } else {
            if (token != null) {
              Navigator.of(context).pushReplacement(
                PageTransition(
                  type: PageTransitionType.fade,
                  child: AttendanceView(),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: Duration(milliseconds: 1500),
                ),
              );
            } else {
              Navigator.of(context).pushReplacement(
                PageTransition(
                  type: PageTransitionType.fade,
                  child: LoginView(),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: Duration(milliseconds: 1500),
                ),
              );
            }
          }

          Timer(
            Duration(milliseconds: 200),
                () {
              _controller.reset();
            },
          );
        }*/
      },


    );
    animation1 = Tween<double>(begin: 30, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 4), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    /*Timer(Duration(seconds: 6), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition2(LoginBody()));
      });
    });*/

    Future.delayed(const Duration(milliseconds: 6000), () {
      RoutingHelper.navToOnboarding(context);

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorHelper.mainColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize*0.95),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: DefaultTextStyle(
                  style: TextStyleHelper.style24B,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'HEALTH CARE',
                        speed: Duration(milliseconds: 130),
                      ),
                    ],
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    displayFullTextOnTap: false,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _width / _containerSize,
                width: _width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(50),
                  shape: BoxShape.circle,
                ),

                child: SvgPicture.asset(
                  ImageHelper.whiteLogo,
                  height:_height*0.2,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class PageTransition2 extends PageRouteBuilder {
  final Widget page;

  PageTransition2(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}
//
// class SplashBody extends StatefulWidget {
//   const SplashBody({Key? key}) : super(key: key);
//
//   @override
//   State<SplashBody> createState() => _SplashBodyState();
// }
//
// class _SplashBodyState extends State<SplashBody> {
//
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(Duration(seconds: 3), () {
//       RoutingHelper.navToOnboarding(context);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     double widthScreen = MediaQuery.of(context).size.width;
//     double heightScreen = MediaQuery.of(context).size.height;
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             ImageHelper.whiteLogo,
//             height:heightScreen*0.2,
//           ),
//           SizedBox(
//             height: 32,
//           ),
//           Text(
//               "HEALTH CARE",
//               style: TextStyleHelper.style24B.copyWith(color: ColorHelper.whiteColor)
//           ),
//
//         ],
//       ),
//     );
//   }
// }
