import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/Homepage_contents/Car_Card.dart';
import '../contents/Report_Card.dart';
import '../contents/modols.dart';

class Report_page extends StatefulWidget {
  const Report_page({super.key});
  @override
  State<Report_page> createState() => _HomepageState();
}

class _HomepageState extends State<Report_page> {
  StreamSubscription? listener;
  List<Car> cars = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();
  }

  listenTocars() {
    listener ??= FirebaseFirestore.instance.collection('stock').snapshots().listen((collection) {
      List<Car> newList = [];
      for (final doc in collection.docs) {
        final car = Car.fromMap(doc.data());
        newList.add(car);
      }
      cars = newList;
      setState(() {});
    });
  }

  bool isHovering = false;
  bool isHovering1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 900,
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                height: Car_Card_Constant.photo_Box_h,
                width: Car_Card_Constant.photo_Box_w,
                child: Image.network(
                  'https://gomechanic.in/blog/wp-content/uploads/2020/08/Indian-car-sales-report-July-2020-brand-wise-01-e1602923109390.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              // const SizedBox(height: 60, child: h_card()),
              const Repoot_Card(),
            ],
          ),
        ),
      )),
    );
  }
}
