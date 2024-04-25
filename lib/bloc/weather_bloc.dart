import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:wether_app_bloc/data/weather_reposi.dart';
import 'package:wether_app_bloc/model/model.dart';



part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<SearchButtonpressed>(_searchbuttonpressed);
  }
  _searchbuttonpressed(
      SearchButtonpressed event, Emitter<WeatherState> emit) async {
    try {
      final result = await Weatherrepository().getweather(event.city);
      List<Weathermodel> results = [];
      results.add(Weathermodel(
        tempmin: convertToCelsius(result['main']['temp_min']),
        tempmax: convertToCelsius(result['main']['temp_max']),
        cityname: result['name'],
        climate: result['weather'][0]['main'],
        temp: convertToCelsius(result['main']['temp']),
      ));
      emit(Fetchingsucess(results));
    } catch (e) {
      emit(Fetchingfailure());
    }
  }

  String convertToCelsius(double kelvin) {
    double celsius = kelvin - 273.15;
    return celsius.toStringAsFixed(2);
  }
}
