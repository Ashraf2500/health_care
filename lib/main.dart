import 'package:flutter/material.dart';
import 'features/features_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

