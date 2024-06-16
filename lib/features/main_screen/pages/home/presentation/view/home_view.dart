import 'package:flutter/material.dart';
import 'package:health_care/features/features_exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    context.read<SwitchFingerprintCubit>().fetchInitialFingerSwitch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        context.read<HomeAppBarCubit>().scrollHomeAppBar(scrollController: scrollController);
        return true;
      },
      child: RefreshIndicator(
        onRefresh: ()async{
         UserTypeData? _userType = context.read<UserTypeCubit>().userType ;
         if(_userType == UserTypeData.patient){
           context.read<GetPopularDoctorsCubit>().getPopularDoctors(context: context);
         }
         else if(_userType == UserTypeData.doctor){
         context.read<GetDoctorAppointmentsCubit>().getDoctorAppointments(context: context );
          }
         else{
         context.read<GetAllAppointmentsCubit>().geAllAppointments(context: context );
         }

        },
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: HomeBody(),
            ),
          ],
          controller: scrollController,
        ),
      ),
    );
  }
}
