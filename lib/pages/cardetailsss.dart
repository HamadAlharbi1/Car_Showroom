import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/modols.dart';
import 'edit_car.dart';

class Cardetailss extends StatefulWidget {
  final Car car;

  const Cardetailss({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  State<Cardetailss> createState() => _CardetailsState();
}

class _CardetailsState extends State<Cardetailss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(
                  widget.car.image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'النوع: ${widget.car.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'السعر: ${widget.car.Price}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCar(
                              car: widget.car,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'تعديل البيانات',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'الموديل: ${widget.car.Model}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                Text(
                  ' ${widget.car.P_number}رقم الموقف:',
                  style: const TextStyle(fontSize: 20),
                ),

                // Text(
                //   'License status: ${widget.car.licensestatus}',
                //   style: Theme.of(context).textTheme.subtitle1,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
