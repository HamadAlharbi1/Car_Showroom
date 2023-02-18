import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/loginpages/navigator.dart';

import 'contents/modols.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: navigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
