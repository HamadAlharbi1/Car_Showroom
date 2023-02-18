import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/modols.dart';
import '../pages/Homepage.dart';
import '../pages/newcar.dart';
import '../pages/stock.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  List<Car> cars = [];
  @override
  void initState() {
    super.initState();
    listenTocars();
  }

  listenTocars() {
    FirebaseFirestore.instance.collection('showroom').snapshots().listen((collection) {
      List<Car> newList = [];
      for (final doc in collection.docs) {
        final car = Car.fromMap(doc.data());
        newList.add(car);
      }
      cars = newList;
      setState(() {});
    });
  }

  var currentIndex = 2;
  static const MyIconcolor = Colors.white38;

  @override
  Widget build(BuildContext context) {
    Widget body;
    var pages = [
      const Homepage(),
      const NewCar(),
      const Homepage(),
      const Homepage(),
      const Stock(),
    ];

    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'اضافة سياره',
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => const NewCar()));
      //   },
      //   backgroundColor: Color.fromARGB(255, 253, 253, 253),
      //   foregroundColor: Colors.black,
      //   child: const Icon(Icons.add),
      // ),

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'التقارير '),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'اضافة سيارة '),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الصالة الرئيسيه'),
          BottomNavigationBarItem(icon: Icon(Icons.request_page), label: 'طلبات العملاء '),
          BottomNavigationBarItem(icon: Icon(Icons.warehouse), label: 'المستودع '),
        ],
        onTap: (newIndex) {
          currentIndex = newIndex;
          setState(() {});
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 16, 96, 130),
        selectedItemColor: const Color.fromARGB(255, 255, 229, 229),
        selectedFontSize: 10,
        unselectedItemColor: const Color.fromARGB(255, 78, 132, 133),
      ),
    );
  }
}
