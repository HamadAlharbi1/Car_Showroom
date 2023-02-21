import 'package:flutter/material.dart';
import 'package:project4/contents/Homepage_contents/Car_Card.dart';
import 'package:project4/contents/Homepage_contents/Order_Card.dart';
import 'package:project4/contents/modols.dart';

class Repoot_Card extends StatefulWidget {
  const Repoot_Card({
    Key? key,
  }) : super(key: key);

  @override
  State<Repoot_Card> createState() => _Car_CardState();
}

class _Car_CardState extends State<Repoot_Card> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                            for (final sales in Data_showroom.reports1)
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
                            for (final sales in Data_showroom.reports2)
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
        ));
  }
}

class sections_Of_reports extends StatelessWidget {
  final String title;
  const sections_Of_reports({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(61, 181, 181, 181),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              My_textstyle2(
                text_1: title,
                text_color: Car_Card_Constant.containercolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class content_of_sections_Of_reports extends StatelessWidget {
  final String title;
  const content_of_sections_Of_reports({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: Car_Card_Constant.report_container_w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Car_Card_Constant.containercolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          My_textstyle2(
            text_1: title,
            text_color: Car_Card_Constant.fontcolor,
          )
        ],
      ),
    );
  }
}
