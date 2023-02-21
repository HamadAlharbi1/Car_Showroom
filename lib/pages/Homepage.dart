import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/Homepage_contents/Car_Card.dart';
import '../contents/modols.dart';
import 'newcar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  StreamSubscription? listener;
  List<Car> cars = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();
  }

  listenTocars() {
    listener ??= FirebaseFirestore.instance.collection('showroom').snapshots().listen((collection) {
      List<Car> newList = [];
      for (final doc in collection.docs) {
        final car = Car.fromMap(doc.data());
        newList.add(car);
      }
      cars = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: 900,
        child: ListView(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: Car_Card_Constant.photo_Box_h,
              width: Car_Card_Constant.photo_Box_w,
              child: Image.network(
                'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/25ec6b15678641.5629596a8daec.jpg',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            // const SizedBox(height: 60, child: h_card()),
            for (var i in cars) Car_Card(i: i)
          ],
        ),
      )),
    );
  }
}

// class h_card extends StatelessWidget {
//   const h_card({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         for (final i in Data_showroom.iconss)
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: InkWell(
//               onTap: (() {
//                 switch (i.description) {
//                   case "add":
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const NewCar()),
//                     );
//                     break;
//                   case "Settings":
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Homepage()),
//                     );
//                     break;
//                   case "Profile":
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Homepage()),
//                     );
//                     break;
//                   // Add more cases for each icon/page
//                 }
//               }),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(200),
//                   ),
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         border: Border(),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(16),
//                         ),
//                       ),
//                       clipBehavior: Clip.hardEdge,
//                       child: Image(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(i.pic),
//                         height: 60,
//                         width: 60,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
