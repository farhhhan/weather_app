part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class SearchButtonpressed extends WeatherEvent {
  final String city;
  SearchButtonpressed(this.city);
}
