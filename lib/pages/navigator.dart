import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/constants.dart';
import 'package:project4/pages/work_in_progress.dart';

import 'Homepage.dart';
import 'Sales_consultants.dart';
import 'Todays_sales.dart';
import 'newcar.dart';
import 'orders.dart';
import 'report.dart';
import 'stock.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({Key? key}) : super(key: key);

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  var currentIndex = 0;
  int work_in_progress = 0;
  int count = 0;
  int count2 = 0;
  @override
  void initState() {
    listenTopending();
    listenTowork_in_progress();
    listenTotodayssales();
  }

  listenTopending() {
    FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      setState(() {
        count = collection.size;
      });
    });
  }

  listenTotodayssales() {
    FirebaseFirestore.instance.collection('Todays_sales').snapshots().listen((collection) {
      setState(() {
        count2 = collection.size;
      });
    });
  }

  listenTowork_in_progress() {
    FirebaseFirestore.instance.collection('work_in_progress').snapshots().listen((collection) {
      setState(() {
        work_in_progress = collection.size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      const Work_In_Progress(), // قيد التنفيذ
      const Report_page(), // التقارير
      const NewCar(), // اضافة سيارة
      const Homepage(), // صالة العرض الرئيسيه
      const Orders(), //'طلبات العملاء
      const Stock(), // المستودع
      const Sales_consultants(), // مناديب المبيعات
      const Todays_sales_page() // مبيعات اليوم
    ];

    return Scaffold(
      body: Row(
        children: [
          Expanded(child: pages[currentIndex]),
          Expanded(
            flex: 0,
            child: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      width: 75,
                      child: Image.network(
                          'https://group-media.mercedes-benz.com/marsMediaSite/scr/1459364190000/7563413v1tv3/D224263-ALL-TIME-STARS-Key-visual-for-the-Mercedes-Benz-Museum.jpg'),
                    ),
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const My_textstyle(
                            My_fontsize: 20,
                            text_1: 'قيد التنفيذ ',
                            text_color: Colors_and_Dimentions.MyIconcolor,
                          ),
                          const SizedBox(
                            width: Colors_and_Dimentions.distance_between_card_parts,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors_and_Dimentions.MyIconcolor, borderRadius: BorderRadius.circular(30)),
                            child: My_textstyle(
                              My_fontsize: 20,
                              text_1: '$work_in_progress',
                              text_color: Colors_and_Dimentions.SelectedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    selected: currentIndex == 0,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'التقارير',
                        text_color: Colors_and_Dimentions.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 1,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'اضافة سيارة',
                        text_color: Colors_and_Dimentions.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 2,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'صالة العرض الرئيسية',
                        text_color: Colors_and_Dimentions.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 3,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const My_textstyle(
                            My_fontsize: 20,
                            text_1: 'طلبات معلقة',
                            text_color: Colors_and_Dimentions.MyIconcolor,
                          ),
                          const SizedBox(
                            width: Colors_and_Dimentions.distance_between_card_parts,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors_and_Dimentions.MyIconcolor, borderRadius: BorderRadius.circular(30)),
                            child: My_textstyle(
                              My_fontsize: 20,
                              text_1: '$count',
                              text_color: Colors_and_Dimentions.SelectedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    selected: currentIndex == 4,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 4;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'المستودع',
                        text_color: Colors_and_Dimentions.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 5,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 5;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'مستشاري المبيعات',
                        text_color: Colors_and_Dimentions.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 6,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 6;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const My_textstyle(
                            My_fontsize: 20,
                            text_1: 'مبيعات اليوم',
                            text_color: Colors_and_Dimentions.MyIconcolor,
                          ),
                          const SizedBox(
                            width: Colors_and_Dimentions.distance_between_card_parts,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors_and_Dimentions.MyIconcolor, borderRadius: BorderRadius.circular(30)),
                            child: My_textstyle(
                              My_fontsize: 20,
                              text_1: '$count2',
                              text_color: Colors_and_Dimentions.SelectedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    selected: currentIndex == 7,
                    selectedTileColor: Colors_and_Dimentions.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 7;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Todays_sales_page