import 'package:flutter/material.dart';
import 'package:weather_forecast/main.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/service/api_service.dart';
import 'package:weather_forecast/utility/colors.dart';
import 'package:weather_forecast/utility/strings.dart';
import 'package:weather_forecast/utility/utils.dart';
import 'package:weather_forecast/view/widgets/common_text_widget.dart';
import 'package:weather_forecast/view/widgets/empty_widget.dart';
import 'package:weather_forecast/view/widgets/home_item_widget.dart';
import 'package:weather_forecast/view/widgets/loader_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void>? future;
  List<WeatherData> citiyWeatherList = [];

  @override
  void initState() {
    super.initState();
    homeVM?.addListener(homeListner);
    setState(() {
    future = homeVM?.getCityWeatherApi();
    });
  }

  @override
  dispose(){
    homeVM?.removeListener(homeListner);
    super.dispose();
  }

  homeListner() {
    if (homeVM?.response != null) {
      if (homeVM!.response.isNotEmpty) {
        citiyWeatherList.clear();
        setState(() {
          citiyWeatherList.addAll(homeVM!.response);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BrandColors.primary,
          leading: const EmptyWidget(),
          centerTitle: false,
          leadingWidth: 0,
          title: CommonTextWidget(
              text: Strings.app_name,
              fontSize: 20,
              fontWeight: FontWeight.normal),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: BrandColors.text,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: BrandColors.background,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return citiyWeatherList.isEmpty
                        ? Center(child: CommonTextWidget(text:Strings.no_data_found))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: (1 / 1)),
                            shrinkWrap: true,
                            itemCount: citiyWeatherList.length,
                            itemBuilder: (context, index) => HomeItemWidget(
                                city: citiyWeatherList[index].name!,
                                country: citiyWeatherList[index].sys!.country!,
                                area_temprature:
                                    "${Utils.convertValue(citiyWeatherList[index].main!.temp!)} ${Strings.degree}C",
                                humidity:
                                    "${citiyWeatherList[index].main!.humidity} %",
                                weather: citiyWeatherList[index]
                                    .weather![0]
                                    .description!,
                                low_temprature:
                                    "${Utils.convertValue(citiyWeatherList[index].main!.tempMin!)} ${Strings.degree}C",
                                high_temprature:
                                    "${Utils.convertValue(citiyWeatherList[index].main!.tempMax!)} ${Strings.degree}C"));
                  default:
                    return const LoaderWidget();
                }
              }),
        ));
  }
}
