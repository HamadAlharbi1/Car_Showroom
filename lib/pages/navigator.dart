import 'package:flutter/material.dart';
import 'package:project4/contents/constants.dart';

import 'Homepage.dart';
import 'newcar.dart';
import 'orders.dart';
import 'report.dart';
import 'stock.dart';

// class navigationBar extends StatefulWidget {
//   const navigationBar({super.key});
//   @override
//   State<navigationBar> createState() => _navigationBarState();
// }

// class _navigationBarState extends State<navigationBar> {
//   var currentIndex = 3;
//   static const MyIconcolor = Colors.white38;

//   @override
//   Widget build(BuildContext context) {
//     Widget body;
//     var pages = [
//       const Report_page(), // التقارير
//       const Report_page(), // التقارير
//       const NewCar(), // اضافة سيارة
//       const Homepage(), // صالة العرض الرئيسيه
//       const Orders(), //'طلبات العملاء
//       const Stock(), // المستودع
//       const Report_page(), // التقارير
//     ];

//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.report), label: 'التقارير '),
//           BottomNavigationBarItem(icon: Icon(Icons.report), label: 'التقارير '),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'اضافة سيارة '),
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الصالة الرئيسيه'),
//           BottomNavigationBarItem(icon: Icon(Icons.request_page), label: 'طلبات العملاء '),
//           BottomNavigationBarItem(icon: Icon(Icons.warehouse), label: 'المستودع '),
//           BottomNavigationBarItem(icon: Icon(Icons.report), label: 'التقارير '),
//         ],
//         onTap: (newIndex) {
//           currentIndex = newIndex;
//           setState(() {});
//         },
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: const Color.fromARGB(255, 16, 96, 130),
//         selectedItemColor: const Color.fromARGB(255, 255, 229, 229),
//         selectedFontSize: 10,
//         unselectedItemColor: const Color.fromARGB(255, 78, 132, 133),
//       ),
//     );
//   }
// }

// class navigationBar extends StatefulWidget {
//   const navigationBar({super.key});

//   @override
//   State<navigationBar> createState() => _navigationBarState();
// }

// class _navigationBarState extends State<navigationBar> {
//   var currentIndex = 3;
//   static const MyIconcolor = Colors.white38;

//   @override
//   Widget build(BuildContext context) {
//     Widget body;
//     var pages = [
//       const Report_page(), // التقارير
//       const Report_page(), // التقارير
//       const NewCar(), // اضافة سيارة
//       const Homepage(), // صالة العرض الرئيسيه
//       const Orders(), //'طلبات العملاء
//       const Stock(), // المستودع
//       const Report_page(), // التقارير
//     ];

//     return Scaffold(
//       body: pages[currentIndex],
//       appBar: AppBar(
//         title: const Text('My App'),
//       ),
//       drawer: SafeArea(
//         child: Drawer(
//           child: Column(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//                 child: Text('Drawer Header'),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.report),
//                 title: const Text('التقارير'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 0;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.report),
//                 title: const Text('التقارير'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 1;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.add),
//                 title: const Text('اضافة سيارة'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 2;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.home),
//                 title: const Text('الصالة الرئيسية'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 3;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.request_page),
//                 title: const Text('طلبات العملاء'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 4;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.warehouse),
//                 title: const Text('المستودع'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 5;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.report),
//                 title: const Text('التقارير'),
//                 onTap: () {
//                   setState(() {
//                     currentIndex = 6;
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       drawerEdgeDragWidth: 0, // Disable the default edge drag width
//     );
//   }
// }

class navigationBar extends StatefulWidget {
  const navigationBar({Key? key}) : super(key: key);

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  var currentIndex = 0;
  static const MyIconcolor = Colors.white38;

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
                    leading: const Icon(Icons.report),
                    title: const Text('التقارير'),
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report),
                    title: const Text('التقارير'),
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('اضافة سيارة'),
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('الصالة الرئيسيه'),
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.request_page),
                    title: const Text('طلبات العملاء'),
                    onTap: () {
                      setState(() {
                        currentIndex = 4;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.warehouse),
                    title: const Text('المستودع'),
                    onTap: () {
                      setState(() {
                        currentIndex = 5;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report),
                    title: const Text('التقارير'),
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
