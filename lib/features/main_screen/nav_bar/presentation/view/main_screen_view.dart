
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class MainScreenView extends StatelessWidget {
  MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeAppBarCubit(),),
        BlocProvider(create: (context) => ShowMorePopularDoctorsCubit(),),
        BlocProvider(create: (context) => MorePopularDoctorsCubit(),),
        BlocProvider(create: (context) => MainNavBarCubit(),),
        //BlocProvider(create: (context) => EditNameCubit(),),

      ],
      child: BlocBuilder<MainNavBarCubit, MainNavBarState>(
        builder: (context, state) {
          int currentPge = (state is MainScreenChanged)?  state.currentPge: 0;
          return Scaffold(
            bottomNavigationBar: CustomMainNavBar(currentPge: currentPge,),
            body: (state is MainScreenChanged)?state.page:HomeView(),
          );
        },
      ),
    );
  }
}
