import 'package:car_rental/data/datasource/firebase_car_data_source.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';
import 'package:car_rental/pages/bloc/car_bloc.dart';
import 'package:car_rental/pages/bloc/car_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/car_repo_impl.dart';

final GetIt sl = GetIt.instance;

void setup() {
  try {
    sl.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    sl.registerLazySingleton<FirebaseCarDataStore>(
        () => FirebaseCarDataStore(firestore: sl<FirebaseFirestore>()));
    sl.registerLazySingleton<CarRepository>(
        () => CarRepoImpl(store: sl<FirebaseCarDataStore>()));
    sl.registerLazySingleton<GetCars>(
        () => GetCars(carRepository: sl<CarRepository>()));
    sl.registerFactory<CarBloc>(() => sl<CarBloc>()..add(LoadCars()));
  } catch (e) {
    rethrow;
  }
}
