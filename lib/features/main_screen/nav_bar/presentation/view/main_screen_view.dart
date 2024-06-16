
import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class MainScreenView extends StatefulWidget {
  MainScreenView({Key? key}) : super(key: key);

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    UserTypeData? _userType = context.read<UserTypeCubit>().userType ;
    context.read<ProfileChatCubit>().getAllProfileChat(context: context);
    if(_userType == UserTypeData.patient){
      context.read<PatientScheduleCubit>().getUerAppointments(context: context );
    }
    else if(_userType == UserTypeData.doctor){
      context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context );
    }
    else{
      context.read<GetAllAppointmentsCubit>().geAllAppointments(context: context );
    }
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
