import 'package:flutter/material.dart';
import 'package:weather_forecast/utility/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: BrandColors.primary,));
  }
}