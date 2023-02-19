import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'contents/Homepage_contents/Car_Card.dart';
import 'contents/modols.dart';
import 'loginpages/navigator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    for (final car in Data_showroom.showroom1) {
      final showroomCollection = FirebaseFirestore.instance.collection('showroom');
      final resDoc = showroomCollection.doc(car.id);
      resDoc.set(car.toMap());
    }
    for (final order in Data_showroom.orders1) {
      final ordersCollection = FirebaseFirestore.instance.collection('orders');
      final resDoc = ordersCollection.doc(order.id);
      resDoc.set(order.toMap());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const navigationBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Car_Card_Constant.containercolor)),
    );
  }
}
// DropdownButton
