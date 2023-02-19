import 'dart:async';

import 'package:flutter/material.dart';

import '../contents/Homepage_contents/Order_Card.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});
  @override
  State<Orders> createState() => _HomepageState();
}

class _HomepageState extends State<Orders> {
  StreamSubscription? listener;
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
          children: const [
            SizedBox(
              height: 24,
            ),
            Order_Card()
          ],
        ),
      )),
    );
  }
}
