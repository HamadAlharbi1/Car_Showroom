// import 'package:flutter/material.dart';
// import 'package:project4/contents/modols.dart';

// import '../contents/constants.dart';

// class Repoot_Card extends StatefulWidget {
//   const Repoot_Card({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Repoot_Card> createState() => _Car_CardState();
// }

// class _Car_CardState extends State<Repoot_Card> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {},
//         child: Column(
//           children: [
//             Container(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color.fromARGB(61, 181, 181, 181),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     children: [
//                       const sections_Of_reports(
//                         title: 'مبيعات السنة',
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: const [
//                           content_of_sections_Of_reports(
//                             title: 'النقاط', //
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'زمن المعاملة',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'عدد السيارات ',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'البائع',
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       SizedBox(
//                         height: 300,
//                         child: ListView(
//                           children: [
//                             const SizedBox(
//                               height: 4,
//                             ),
//                             for (final sales in Data.reports1)
//                               Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 4,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Row_container_Content(
//                                         text_content: sales.s_points, //النقاط
//                                       ),
//                                       Row_container_Content(
//                                         text_content: sales.Period_of_s, //زمن المعاملة
//                                       ),
//                                       Row_container_Content(
//                                         text_content: sales.Number_of_salles, //عدد السيارات
//                                       ),
//                                       Row_container_Content(
//                                         text_content: sales.saler_name, //البائع
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                           ],
//                         ),
//                       ),
//                       const sections_Of_reports(
//                         title: 'مبيعات الشهر',
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: const [
//                           content_of_sections_Of_reports(
//                             title: 'النقاط', //
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'زمن المعاملة',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'عدد السيارات ',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'البائع',
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 300,
//                         child: ListView(
//                           children: [
//                             const SizedBox(
//                               height: 4,
//                             ),
//                             for (final sales in Data.reports2)
//                               Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 4,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Row_container_Content(
//                                         text_content: sales.s_points, //النقاط
//                                       ),
//                                       Row_container_Content(
//                                         text_content: sales.Period_of_s, //زمن المعاملة
//                                       ),
//                                       Row_container_Content(
//                                         text_content: sales.Number_of_salles, //عدد السيارات
//                                       ),
//                                       Row_container_Content(
//                                         text_content: sales.saler_name, //البائع
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                           ],
//                         ),
//                       ),
//                       const sections_Of_reports(
//                         title: 'مبيعات اليوم',
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: const [
//                           content_of_sections_Of_reports(
//                             title: 'المبلغ',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'السيارة',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'العميل',
//                           ),
//                           content_of_sections_Of_reports(
//                             title: 'البائع',
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: const [
//                           Row_container_Content(
//                             text_content: '', //المبلغ
//                           ),
//                           Row_container_Content(
//                             text_content: '', //السيارة
//                           ),
//                           Row_container_Content(
//                             text_content: '', //العميل
//                           ),
//                           Row_container_Content(
//                             text_content: '', //البائع
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
