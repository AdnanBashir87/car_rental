import 'package:car_rental/data/datasource/firebase_car_data_source.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

class CarRepoImpl implements CarRepository {
  final FirebaseCarDataStore store;

  CarRepoImpl({required this.store});

  @override
  Future<List<Car>> fetchCars() {
    return store.getCars();
  }
}
