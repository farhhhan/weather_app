import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_bloc/bloc/weather_bloc.dart';
import 'package:wether_app_bloc/screens/weather.dart';
import 'package:wether_app_bloc/screens/widgets/widgets.dart';
 class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final citycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is Fetchingfailure) {
            showSnack(context);
          }
          if (state is Fetchingsucess) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Weather()));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                40, 1.2 * kToolbarHeight, 40, 1.2 * kToolbarHeight),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  const HomeAlignColor(),
                  const HomeAlignColor2(),
                  const HomeAlignColor3(),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image.asset("assets/images/1.png"),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Discover The Weather \n          In Your City",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomeTextFormField(citycontroller: citycontroller),
                        const SizedBox(
                          height: 10,
                        ),
                        HomeTextButton(citycontroller: citycontroller)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


