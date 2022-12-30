import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meteo/model/weathermodel.dart';
import 'package:meteo/services/network.dart';

class WeatherCubit extends Cubit<WeatherModel>{
  WeatherModel weatherModel = WeatherModel();

  WeatherCubit() : super(WeatherModel());

  Future<WeatherModel> doSearch (String cityName) async {
    weatherModel = await Network.getWeatherForecastData(cityName: cityName);
    emit(weatherModel);
    return weatherModel;
  }

}