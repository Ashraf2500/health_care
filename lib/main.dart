import 'package:flutter/material.dart';
import 'package:health_care/features/main_screen/pages/profile/presentation/manager/edit_photo/edit_photo_cubit.dart';
import 'features/features_exports.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
void main() async{
  runApp(const MyApp());

  await langdetect.initLangDetect();
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => MyApp(), // Wrap your app
  // ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserTypeCubit(),),
        BlocProvider(create: (context) => GetDoctorInfoCubit(),),
        BlocProvider(create: (context) => EditGeneralInfoCubit(),),
        //BlocProvider(create: (context) => EditPhoneCubit(),),
        BlocProvider(create: (context) => EditSpecialtyCubit(),),
        //BlocProvider(create: (context) => ChatBotCubit(),),
        BlocProvider(create: (context) => ReportDetailsCubit(),),
        BlocProvider(create: (context) => SwitchFingerprintCubit(),),
        BlocProvider(create: (context) => CurrentUserDataCubit(),),
        BlocProvider(create: (context) => EditPhotoCubit()),
        BlocProvider(create: (context) => GetPopularDoctorsCubit()),
        BlocProvider(create: (context) => PatientScheduleCubit()),
        BlocProvider(create: (context) => GetDoctorCubit()),
        BlocProvider(create: (context) => GetDoctorAppointmentsCubit()),
        BlocProvider(create: (context) => CreateDoctorCubit()),
        BlocProvider(create: (context) => GetDoctorScheduleCubit()),
        BlocProvider(create: (context) => GetAllAppointmentsCubit()),
        BlocProvider(create: (context) => RatingCubit()),
        BlocProvider(create: (context) => CreateAppointmentCubit()),
        BlocProvider(create: (context) => DeleteAppointmentCubit()),
        BlocProvider(create: (context) => DeleteDoctorCubit()),
        BlocProvider(create: (context) => DeleteUserCubit()),
        BlocProvider(create: (context) => ConfirmAppointmentCubit()),
        BlocProvider(create: (context) => CreateMedicineCubit()),
        BlocProvider(create: (context) => GetDoctorReportsCubit()),
        BlocProvider(create: (context) => GetPatientReportsCubit()),
        BlocProvider(create: (context) => ReportDiagnosisDetailsCubit()),
        BlocProvider(create: (context) => GetAllPatientsCubit()),
        BlocProvider(create: (context) => PrivateChatCubit()),
        BlocProvider(create: (context) => ProfileChatCubit()),
        BlocProvider(create: (context) => DeleteReportCubit()),
        BlocProvider(create: (context) => ConvertSoundCubit()),
        BlocProvider(create: (context) => ConvertSoundAdviceCubit()),
        BlocProvider(create: (context) => GetDoctorScheduleSharfCubit()),
        // BlocProvider(create: (context) => CreateReportCubit()),


      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: ColorHelper.mainColor,
            background: ColorHelper.backWhiteColor,
          ),
          textTheme: GoogleFonts.robotoTextTheme(),
          useMaterial3: true,
        ),
        onGenerateRoute: RoutingHelper.generateRoute,
        initialRoute: StringsRouting.splash,
      ),
    );
  }
}

