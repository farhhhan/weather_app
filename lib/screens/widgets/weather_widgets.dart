import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherAlign extends StatelessWidget {
  const WeatherAlign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.deepPurple),
      ),
    );
  }
}
class WeatherAlign2 extends StatelessWidget {
  const WeatherAlign2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-3, -0.3),
      child: Container(
        height: 400,
        width: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
class WeatherAlign3 extends StatelessWidget {
  const WeatherAlign3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
        height: 300,
        width: 600,
        decoration: const BoxDecoration(
          color: Color(0xFFFFAB40),
        ),
      ),
    );
  }
}

class WeatherTempMinImage extends StatelessWidget {
  const WeatherTempMinImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/14.png",
      height: 80,
      width: 70,
    );
  }
}

class WeatherTempMaxImage extends StatelessWidget {
  const WeatherTempMaxImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/13.png",
      height: 80,
      width: 70,
    );
  }
}

class WeatherImage1 extends StatelessWidget {
  const WeatherImage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/4.png");
  }
}

class WeatherTempMaxText extends StatelessWidget {
  const WeatherTempMaxText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Temp max",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class WeatherTempMinText extends StatelessWidget {
  const WeatherTempMinText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Temp min",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}


class WeatherBackDropFilter extends StatelessWidget {
  const WeatherBackDropFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
      child: Container(
        decoration:
            const BoxDecoration(color: Colors.transparent),
      ),
    );
  }
}


