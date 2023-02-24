import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/modols.dart';

import '../contents/constants.dart';

class Sales_consultants extends StatefulWidget {
  const Sales_consultants({super.key});
  @override
  State<Sales_consultants> createState() => _HomepageState();
}

class _HomepageState extends State<Sales_consultants> {
  StreamSubscription? listener;
  StreamSubscription? listener2;
  List<Saled_reports> sales_consultants = [];
  List<Saled_reports> report_of_Month = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listen_To_report_of_year();
    listen_To_report_of_Month();
  }

  listen_To_report_of_year() {
    listener ??= FirebaseFirestore.instance
        .collection('report_of_sales')
        .orderBy('s_Y_points', descending: true)
        .snapshots()
        .listen((collection) {
      List<Saled_reports> newList = [];
      for (final doc in collection.docs) {
        final car = Saled_reports.fromMap(doc.data());
        newList.add(car);
      }
      sales_consultants = newList;
      setState(() {});
    });
  }

  listen_To_report_of_Month() {
    listener2 ??= FirebaseFirestore.instance
        .collection('report_of_sales')
        .orderBy('s_M_points', descending: true)
        .snapshots()
        .listen((collection) {
      List<Saled_reports> newList = [];
      for (final doc in collection.docs) {
        final car = Saled_reports.fromMap(doc.data());
        newList.add(car);
      }
      report_of_Month = newList;
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
                  'https://t4.ftcdn.net/jpg/04/83/26/85/360_F_483268546_2RYpGrXpbOzB4ogRrzF3zDonwijt9MIF.jpg',
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
                                  title: 'النقاط', //
                                ),
                                content_of_sections_Of_reports(
                                  title: 'زمن المعاملة',
                                ),
                                content_of_sections_Of_reports(
                                  title: 'الهدف الشهري ',
                                ),
                                content_of_sections_Of_reports(
                                  title: 'تقييم العملاء',
                                ),
                                content_of_sections_Of_reports(
                                  title: 'قيد التنفيذ',
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
                              height: 900,
                              child: ListView(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  for (final sales in sales_consultants)
                                    InkWell(
                                      onTap: (() {}),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Row_container_Content_2(
                                                text_content: sales.s_Y_points, //النقاط
                                              ),
                                              Row_container_Content_2(
                                                text_content: sales.Period_of_Y_s, //زمن المعاملة
                                              ),
                                              Row_container_Content_2(
                                                text_content: sales.Number_of_Y_salles, //عدد السيارات
                                              ),
                                              Row_container_Content_2(
                                                text_content: sales.Number_of_Y_salles, //عدد السيارات
                                              ),
                                              Row_container_Content_2(
                                                text_content: sales.Number_of_Y_salles, //عدد السيارات
                                              ),
                                              Row_container_Content_2(
                                                text_content: sales.saler_name, //البائع
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                        ],
                                      ),
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
