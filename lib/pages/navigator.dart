import 'package:flutter/material.dart';
import 'package:project4/contents/constants.dart';

import 'Homepage.dart';
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

  @override
  Widget build(BuildContext context) {
    var pages = [
      const Report_page(), // التقارير
      const Report_page(), // التقارير
      const NewCar(), // اضافة سيارة
      const Homepage(), // صالة العرض الرئيسيه
      const Orders(), //'طلبات العملاء
      const Stock(), // المستودع
      const Report_page(), // التقارير
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
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'التقارير',
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 0,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
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
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 1,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
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
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 2,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
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
                        text_1: 'الصفحة الرئيسية',
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 3,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      alignment: Alignment.topRight,
                      child: const My_textstyle(
                        My_fontsize: 20,
                        text_1: 'طلبات العملاء',
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 4,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
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
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 5,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
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
                        text_1: 'التقارير',
                        text_color: Car_Card_Constant.MyIconcolor,
                      ),
                    ),
                    selected: currentIndex == 6,
                    selectedTileColor: Car_Card_Constant.SelectedColor,
                    onTap: () {
                      setState(() {
                        currentIndex = 6;
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
