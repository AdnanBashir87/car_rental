import 'package:car_rental/pages/widgets/car_card.dart';
import 'package:car_rental/pages/widgets/more_card.dart';
import 'package:flutter/material.dart';
import '../../data/models/car.dart';
import '../map_detail_screen/map_detail_screen.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 10),
            Text("Information"),
          ],
        ),
      ),
      body: Column(
        children: [
          const CarCard(
            car: Car(
              model: "Fortuner GR",
              distance: 500,
              fuelCapacity: 60,
              pricePerHour: 30,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 160,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xfff3f3f3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Image.asset("assets/user.png"),
                        ),
                        const Text(
                          "Adnan Bashir",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text("\$6,345",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MapDetailScreen(car: widget.car),
                        ),
                      );
                    },
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                        // image: const DecorationImage(
                        //   image: AssetImage("assets/maps.png"),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/maps.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              MoreCard(
                car: Car(
                  model: "${widget.car.model} 1",
                  distance: widget.car.distance + 100,
                  fuelCapacity: widget.car.fuelCapacity + 100,
                  pricePerHour: widget.car.pricePerHour + 10,
                ),
              ),
              MoreCard(
                car: Car(
                  model: "${widget.car.model} 2",
                  distance: widget.car.distance + 200,
                  fuelCapacity: widget.car.fuelCapacity + 200,
                  pricePerHour: widget.car.pricePerHour + 20,
                ),
              ),
              MoreCard(
                car: Car(
                  model: "${widget.car.model} 3",
                  distance: widget.car.distance + 300,
                  fuelCapacity: widget.car.fuelCapacity + 300,
                  pricePerHour: widget.car.pricePerHour + 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
