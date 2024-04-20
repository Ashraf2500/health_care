import 'package:flutter/material.dart';
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
        BlocProvider(create: (context) => UserCubit(),),
        BlocProvider(create: (context) => GetDoctorInfoCubit(),),
        BlocProvider(create: (context) => EditNameCubit(),),
        BlocProvider(create: (context) => EditPhoneCubit(),),
        BlocProvider(create: (context) => EditSpecialtyCubit(),),
        //BlocProvider(create: (context) => ChatBotCubit(),),
        BlocProvider(create: (context) => ReportDetailsCubit(),),

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

