import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';

import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc(this.getCars) : super(CarLoading()) {
    on<LoadCars>(_onLoadCars);
  }

  void _onLoadCars(LoadCars event, Emitter<CarState> emit) async {
    try {
      final cars = await getCars.call();
      emit(CarLoaded(cars: cars));
    } catch (e) {
      emit(ErrorMessage(message: e.toString()));
    }
  }
}
