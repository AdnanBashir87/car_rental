import 'package:car_rental/pages/bloc/car_state.dart';
import 'package:car_rental/pages/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/car.dart';
import '../bloc/car_bloc.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({super.key});

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  final List<Car> cars = [
    const Car(
      model: "Fortuner GR",
      distance: 470,
      fuelCapacity: 60,
      pricePerHour: 50,
    ),
    const Car(
      model: "Toyota Corolla",
      distance: 325,
      fuelCapacity: 50,
      pricePerHour: 35,
    ),
    const Car(
      model: "Toyota Yaris",
      distance: 500,
      fuelCapacity: 50,
      pricePerHour: 40,
    ),
    const Car(
      model: "Honda Civic",
      distance: 450,
      fuelCapacity: 55,
      pricePerHour: 45,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your car"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
          // BlocBuilder<CarBloc, CarState>(
          //   builder: (context, state) {
          //     if (state is CarLoading) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (state is CarLoaded) {
          //       return
          ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(
            car: cars[index],
          );
        },
      ),
      // } else if (state is ErrorMessage) {
      //   return Center(
      //     child: Text("Something went Wrong!\nERROR: ${state.message}"),
      //   );
      // } else {
      //   return Container();
      // }
      // },
      // ),
    );
  }
}
