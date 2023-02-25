import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/pages/add_orderss.dart';
import 'package:project4/pages/navigator.dart';

import 'contents/constants.dart';
import 'contents/modols.dart';
import 'pages/add_order.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    for (final car in Data.showroom1) {
      final showroomCollection = FirebaseFirestore.instance.collection('showroom');
      final resDoc = showroomCollection.doc(car.id);
      resDoc.set(car.toMap());
    }
    for (final order in Data.orders1) {
      final ordersCollection = FirebaseFirestore.instance.collection('orders');
      final resDoc = ordersCollection.doc(order.id);
      resDoc.set(order.toMap());
    }
    for (final reportOfYear in Data.reports1) {
      final ordersCollection = FirebaseFirestore.instance.collection('report_of_sales');
      final resDoc = ordersCollection.doc(reportOfYear.id);
      resDoc.set(reportOfYear.toMap());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const navigationBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          drawerTheme: const DrawerThemeData(
              backgroundColor: Colors_and_Dimentions.containercolor, scrimColor: Color.fromARGB(255, 249, 249, 249)),
          appBarTheme: const AppBarTheme(backgroundColor: Colors_and_Dimentions.containercolor)),
    );
  }
}

// DropdownButton
