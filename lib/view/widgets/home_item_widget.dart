import 'package:flutter/material.dart';
import 'package:weather_forecast/utility/colors.dart';
import 'package:weather_forecast/utility/strings.dart';
import 'package:weather_forecast/utility/utils.dart';
import 'package:weather_forecast/view/widgets/common_text_widget.dart';

class HomeItemWidget extends StatelessWidget {
  final String city;
  final String country;
  final String area_temprature;
  final String humidity;
  final String weather;
  final String low_temprature;
  final String high_temprature;
  const HomeItemWidget(
      {super.key,
      required this.city,
      required this.country,
      required this.area_temprature,
      required this.humidity,
      required this.weather,
      required this.low_temprature,
      required this.high_temprature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      decoration: const BoxDecoration(
        color: BrandColors.card_background,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonTextWidget(
                text: "$city, $country",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CommonTextWidget(
                    text: area_temprature,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  Image.asset(
                    Utils.getIcon(weather),
                    height: 25,
                    width: 25,
                    color: BrandColors.text,
                  )
                ],
              )
            ],
          ),
          CommonTextWidget(
            text: weather,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CommonTextWidget(
                text: Strings.humidity,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              CommonTextWidget(
                text: humidity,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CommonTextWidget(
                text: Strings.low,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              CommonTextWidget(
                text: low_temprature,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CommonTextWidget(
                text: Strings.high,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              CommonTextWidget(
                text: high_temprature,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ],
      ),
    );
  }
}
