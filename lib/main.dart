import 'package:flutter/material.dart';
import 'features/features_exports.dart';

void main() {
  runApp(const MyApp());

  /*runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ),);*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(),),
      ],
      child: MaterialApp(
        /*locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,*/
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

