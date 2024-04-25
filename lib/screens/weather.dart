import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wether_app_bloc/bloc/weather_bloc.dart';
import 'package:wether_app_bloc/screens/widgets/weather_widgets.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is Fetchingsucess) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width:MediaQuery.of(context).size.width ,
                  child: Stack(
                    children: [
                      const WeatherAlign(),
                      const WeatherAlign2(),
                      const WeatherAlign3(),
                      const WeatherBackDropFilter(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              state.results[0].cityname,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const WeatherImage1(),
                            Text(
                              state.results[0].climate,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${state.results[0].temp.toString()} °C',
                              style: const TextStyle(
                                fontSize: 65,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WeatherTempWidget(
                                  icon: const WeatherTempMaxImage(),
                                  text: const WeatherTempMaxText(),
                                  value: '${state.results[0].tempmax.toString()} °C',
                                ),
                                const SizedBox(width: 20),
                                WeatherTempWidget(
                                  icon: const WeatherTempMinImage(),
                                  text: const WeatherTempMinText(),
                                  value: '${state.results[0].tempmin.toString()} °C',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class WeatherTempWidget extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final String value;

  const WeatherTempWidget({
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text,
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
