import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/modols.dart';

import '../contents/constants.dart';

class Work_In_Progress extends StatefulWidget {
  const Work_In_Progress({super.key});
  @override
  State<Work_In_Progress> createState() => _HomepageState();
}

class _HomepageState extends State<Work_In_Progress> {
  StreamSubscription? listener;
  List<Workinprogress> woek_in_progress = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTowork_in_progress();
  }

  listenTowork_in_progress() {
    listener ??= FirebaseFirestore.instance.collection('work_in_progress').snapshots().listen((collection) {
      List<Workinprogress> newList = [];
      for (final doc in collection.docs) {
        final order = Workinprogress.fromMap(doc.data());
        newList.add(order);
      }
      woek_in_progress = newList;
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
                  'https://cfx-wp-images.imgix.net/2021/01/GettyImages-1173046836-scaled.jpg?auto=compress%2Cformat&ixlib=php-3.3.0&s=04d1443ce882d5ce451692b0db3a8788',
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
                                  for (final sales in woek_in_progress)
                                    InkWell(
                                      onTap: (() {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const My_textstyle(
                                                text_1: 'هل تم انهاء الطلب ',
                                                text_color: Colors_and_Dimentions.containercolor,
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            padding: const EdgeInsets.only(
                                                                top: 4, bottom: 4, left: 10, right: 10),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12),
                                                              color: Colors_and_Dimentions.containercolor,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: const [
                                                                My_textstyle(
                                                                    text_1: 'لا',
                                                                    text_color: Colors_and_Dimentions.fontcolor),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        FirebaseFirestore.instance
                                                            .collection('Todays_sales')
                                                            .doc(sales.id)
                                                            .set(sales.toMap());
                                                        FirebaseFirestore.instance
                                                            .collection('work_in_progress')
                                                            .doc(sales.id)
                                                            .delete();
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            padding: const EdgeInsets.only(
                                                                top: 4, bottom: 4, left: 10, right: 10),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12),
                                                              color: Colors_and_Dimentions.containercolor,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: const [
                                                                My_textstyle(
                                                                    text_1: 'نعم',
                                                                    text_color: Colors_and_Dimentions.fontcolor),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                              backgroundColor: Colors_and_Dimentions.title_container_color,
                                            );
                                          },
                                        );
                                      }),
                                      child: Column(
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
