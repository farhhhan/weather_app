import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_bloc/bloc/weather_bloc.dart';

class HomeAlignColor extends StatelessWidget {
  const HomeAlignColor({
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

class HomeAlignColor3 extends StatelessWidget {
  const HomeAlignColor3({
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

class HomeAlignColor2 extends StatelessWidget {
  const HomeAlignColor2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

showSnack(context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      backgroundColor: Colors.deepPurple,
      content: Center(
        child: Text(
          'City Not Found',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      duration: Duration(seconds: 3), // Adjust duration as needed
    ),
  );
}

class HomeTextFormField extends StatelessWidget {
  const HomeTextFormField({
    super.key,
    required this.citycontroller,
  });

  final TextEditingController citycontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: citycontroller,
      keyboardType: TextInputType.streetAddress,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        labelText: "Enter Your City",
        labelStyle: TextStyle(color: Colors.white70),
        hintText: "E.g., New York",
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(20)),
          borderSide:
              BorderSide(color: Colors.amber, width: 2.0),
        ),
      ),
    );
  }
}

class HomeTextButton extends StatelessWidget {
  const HomeTextButton({
    super.key,
    required this.citycontroller,
  });

  final TextEditingController citycontroller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        context
            .read<WeatherBloc>()
            .add(SearchButtonpressed(citycontroller.text));
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
            const Size(200, 5)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: const Text(
        "Search City",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}