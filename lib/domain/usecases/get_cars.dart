import 'package:car_rental/domain/repositories/car_repository.dart';

import '../../data/models/car.dart';

class GetCars {
  final CarRepository carRepository;

  GetCars({required this.carRepository});

  Future<List<Car>> call() async {
    return await carRepository.fetchCars();
  }
}
