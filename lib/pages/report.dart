import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/modols.dart';

import '../contents/constants.dart';

class Report_page extends StatefulWidget {
  const Report_page({super.key});
  @override
  State<Report_page> createState() => _HomepageState();
}

class _HomepageState extends State<Report_page> {
  StreamSubscription? listener;
  List<Saled_reports> report_of_year = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();
  }

  listenTocars() {
    listener ??= FirebaseFirestore.instance
        .collection('report_of_year')
        .orderBy('s_points', descending: true)
        .snapshots()
        .listen((collection) {
      List<Saled_reports> newList = [];
      for (final doc in collection.docs) {
        final car = Saled_reports.fromMap(doc.data());
        newList.add(car);
      }
      report_of_year = newList;
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
              // const Report_Card(),
              InkWell(
                  onTap: () {},
                  child: Column(
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
                                const sections_Of_reports(
                                  title: 'مبيعات السنة',
                                ),
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
                                      title: 'عدد السيارات ',
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
                                      for (final sales in report_of_year)
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Row_container_Content(
                                                  text_content: sales.s_points, //النقاط
                                                ),
                                                Row_container_Content(
                                                  text_content: sales.Period_of_s, //زمن المعاملة
                                                ),
                                                Row_container_Content(
                                                  text_content: sales.Number_of_salles, //عدد السيارات
                                                ),
                                                Row_container_Content(
                                                  text_content: sales.saler_name, //البائع
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                const sections_Of_reports(
                                  title: 'مبيعات الشهر',
                                ),
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
                                      title: 'عدد السيارات ',
                                    ),
                                    content_of_sections_Of_reports(
                                      title: 'البائع',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 300,
                                  child: ListView(
                                    children: [
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      for (final sales in Data.reports2)
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Row_container_Content(
                                                  text_content: sales.s_points, //النقاط
                                                ),
                                                Row_container_Content(
                                                  text_content: sales.Period_of_s, //زمن المعاملة
                                                ),
                                                Row_container_Content(
                                                  text_content: sales.Number_of_salles, //عدد السيارات
                                                ),
                                                Row_container_Content(
                                                  text_content: sales.saler_name, //البائع
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                const sections_Of_reports(
                                  title: 'مبيعات اليوم',
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    content_of_sections_Of_reports(
                                      title: 'المبلغ',
                                    ),
                                    content_of_sections_Of_reports(
                                      title: 'السيارة',
                                    ),
                                    content_of_sections_Of_reports(
                                      title: 'العميل',
                                    ),
                                    content_of_sections_Of_reports(
                                      title: 'البائع',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Row_container_Content(
                                      text_content: '', //المبلغ
                                    ),
                                    Row_container_Content(
                                      text_content: '', //السيارة
                                    ),
                                    Row_container_Content(
                                      text_content: '', //العميل
                                    ),
                                    Row_container_Content(
                                      text_content: '', //البائع
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
