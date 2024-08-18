import 'package:car_rental/data/models/car.dart';

abstract class CarState {
  const CarState();
}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<Car> cars;

  CarLoaded({required this.cars});
}

class ErrorMessage extends CarState {
  final String message;

  ErrorMessage({required this.message});
}
