import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/modols.dart';

import '../contents/constants.dart';

class Todays_sales_page extends StatefulWidget {
  const Todays_sales_page({super.key});
  @override
  State<Todays_sales_page> createState() => _HomepageState();
}

class _HomepageState extends State<Todays_sales_page> {
  StreamSubscription? listener;
  List<Workinprogress> todays_sales = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTotodays_sales();
  }

  listenTotodays_sales() {
    listener ??= FirebaseFirestore.instance.collection('Todays_sales').snapshots().listen((collection) {
      List<Workinprogress> newList = [];
      for (final doc in collection.docs) {
        final order = Workinprogress.fromMap(doc.data());
        newList.add(order);
      }
      todays_sales = newList;
      setState(() {});
    });
  }

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
                height: Colors_and_Dimentions.photo_Box_h,
                width: Colors_and_Dimentions.photo_Box_w,
                child: Image.network(
                  'https://play-lh.googleusercontent.com/Jom-ujD1mdXLuRG6NvnGKa9jlIljkrF_UMbUdLaKeJIuYgcqn37267LJMzBfuMzg5A',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              // const Report_Card(),
              Column(
                children: [
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(61, 181, 181, 181),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                content_of_sections_Of_reports(
                                  title: 'المديل', //
                                ),
                                content_of_sections_Of_reports(
                                  title: 'اللون',
                                ),
                                content_of_sections_Of_reports(
                                  title: ' نوع المركبة ',
                                ),
                                content_of_sections_Of_reports(
                                  title: 'البائع',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 300,
                              child: ListView(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  for (final sales in todays_sales)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row_container_Content(
                                              text_content: sales.V_model, //الموديل
                                            ),
                                            Row_container_Content(
                                              text_content: sales.V_color, // اللون
                                            ),
                                            Row_container_Content(
                                              text_content: sales.V_type, //عدد السيارات
                                            ),
                                            Row_container_Content(
                                              text_content: sales.sellername, //البائع
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
