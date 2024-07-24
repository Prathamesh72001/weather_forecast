import 'package:flutter/material.dart';
import 'package:weather_forecast/view%20model/home_view_model.dart';
import 'router/router.dart';
import 'utility/colors.dart';
import 'utility/strings.dart';


HomeViewModel? homeVM;
void main() {
  initViewModels();
  runApp(const MyApp());
}

void initViewModels() {
  homeVM = HomeViewModel();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: Strings.app_name,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: BrandColors.primary),
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.homeScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
