import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/Homepage_contents/Order_Card.dart';
import '../contents/modols.dart';
import 'add_order.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});
  @override
  State<Orders> createState() => _HomepageState();
}

class _HomepageState extends State<Orders> {
  StreamSubscription? listener;
  List<Order_detail_1> orders = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();
  }

  listenTocars() {
    listener ??= FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      List<Order_detail_1> newList = [];
      for (final doc in collection.docs) {
        final order = Order_detail_1.fromMap(doc.data());
        newList.add(order);
      }
      orders = newList;
      setState(() {});
    });
  }

  final selecteditrrm = 'Toyota';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _pNumberController = TextEditingController();
  final TextEditingController _insuranceController = TextEditingController();
  final TextEditingController _parkingNumberController = TextEditingController();
  final TextEditingController _licenseStatusController = TextEditingController();

  // List<Order> orderss = [];
  // @override
  // void initState() {
  //   listener?.cancel();
  //   super.initState();
  //   listenToorderss();
  // }
  // listenToorderss() {
  //   listener ??= FirebaseFirestore.instance.collection('showroom').snapshots().listen((collection) {
  //     List<Orders> newList = [];
  //     for (final doc in collection.docs) {
  //       final orders = Orders.fromMap(doc.data());
  //       newList.add(orders);
  //     }
  //     orderss = newList;
  //     setState(() {});
  //   });
  // }
  // bool isHovering = false;
  // bool isHovering1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: 900,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: Car_Card_Constant.photo_Box_h,
              width: Car_Card_Constant.photo_Box_w,
              child: Image.network(
                'https://i2.wp.com/tradesmartonline.in/blog/wp-content/uploads/2017/07/buy-a-car.png?fit=759%2C422&ssl=1',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Order_Card(),
            add_oreder(
                parkingNumberController: _parkingNumberController,
                pNumberController: _pNumberController,
                insuranceController: _insuranceController,
                licenseStatusController: _licenseStatusController,
                modelController: _modelController,
                priceController: _priceController,
                nameController: _nameController,
                selecteditrrm: selecteditrrm),
          ],
        ),
      )),
    );
  }
}
