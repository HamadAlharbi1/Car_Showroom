import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/Homepage_contents/stock_card.dart';
import 'package:project4/contents/constants.dart';

import '../contents/modols.dart';
import 'Homepage.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});
  @override
  State<Stock> createState() => _HomepageState();
}

class _HomepageState extends State<Stock> {
  int count = 0;
  int total_P = 150;
  int get available_P => total_P - count;
  StreamSubscription? listener;
  List<Car> cars = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();
    listenTolength();
  }

  listenTolength() {
    FirebaseFirestore.instance.collection('stock').snapshots().listen((collection) {
      setState(() {
        count = collection.size;
      });
    });
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
                'https://t4.ftcdn.net/jpg/03/02/27/95/360_F_302279500_a5GGFqnBM9YPJnBY7RxIQXL2UtQHUKyu.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                head_title_icon(
                  container_action: 'المواقف المتاحة',
                  available_P: available_P,
                  imageUrl:
                      'https://thumbs.dreamstime.com/b/parking-lot-flat-icon-isolated-white-red-sportive-car-blue-sign-background-eps-file-available-93753209.jpg',
                ),
                head_title_icon(
                  container_action: 'سعة المستودع',
                  available_P: total_P,
                  imageUrl: 'https://cdn0.iconfinder.com/data/icons/car-services/500/Car_Service_9-512.png',
                ),
                head_title_icon(
                  container_action: ' عدد المركبات  ',
                  available_P: count,
                  imageUrl: 'https://cdn0.iconfinder.com/data/icons/car-services/500/Car_Service_9-512.png',
                ),
              ],
            ),
            for (var i in cars) Stok_card(i: i)
          ],
        ),
      )),
    );
  }
}
