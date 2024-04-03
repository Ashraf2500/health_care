import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class CustomMainNavBar extends StatelessWidget {
   CustomMainNavBar({
    Key? key,
     required this.currentPge ,
  }) : super(key: key);

  int currentPge ;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        context.read<MainNavBarCubit>().chooseNavPage(indexPage: index);
      },
      currentIndex:currentPge,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "",
        ),
      ],
    );
  }
}
