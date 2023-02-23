import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Homepage_contents/Car_Card.dart';
import '../contents/constants.dart';
import '../contents/modols.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;
  int total_P = 20;
  int get available_P => total_P - count;

  StreamSubscription? listener;
  List<Car> cars = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();

    listenTocars();
    listenTolength();
  }

  listenTolength() {
    FirebaseFirestore.instance.collection('showroom').snapshots().listen((collection) {
      setState(() {
        count = collection.size;
      });
    });
  }

  listenTocars() {
    listener ??= FirebaseFirestore.instance
        .collection('showroom')
        .orderBy('Model', descending: true)
        .snapshots()
        .listen((collection) {
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
          child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              const height_1(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  head_title_icon(
                    container_action: 'المواقف المتاحة',
                    available_P: available_P,
                    imageUrl:
                        'https://thumbs.dreamstime.com/b/parking-lot-flat-icon-isolated-white-red-sportive-car-blue-sign-background-eps-file-available-93753209.jpg',
                  ),
                  head_title_icon(
                    container_action: 'سعة المعرض',
                    available_P: total_P,
                    imageUrl: 'https://cdn0.iconfinder.com/data/icons/car-services/500/Car_Service_9-512.png',
                  ),
                  head_title_icon(
                    container_action: '  عدد المركبات ',
                    available_P: count,
                    imageUrl: 'https://cdn0.iconfinder.com/data/icons/car-services/500/Car_Service_9-512.png',
                  ),
                ],
              ),
              const height_1(),
              // const SizedBox(height: 60, child: h_card()),
              for (var i in cars) Car_Card(i: i)
            ],
          ),
        ),
      )),
    );
  }
}

class head_title_icon extends StatelessWidget {
  final String container_action;
  final String imageUrl;
  const head_title_icon({Key? key, required this.available_P, required this.imageUrl, required this.container_action})
      : super(key: key);

  final int available_P;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          custom_container(
            container_title: '$available_P',
            container_action: container_action,
          ),
          Image.network(
            imageUrl,
            height: 45,
          )
        ],
      ),
    );
  }
}

class height_1 extends StatelessWidget {
  const height_1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: Car_Card_Constant.distance_between_card_parts);
  }
}

class custom_container extends StatelessWidget {
  final String container_title;
  final String container_action;
  const custom_container({Key? key, required this.container_title, required this.container_action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 200,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Car_Card_Constant.containercolor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              My_textstyle(
                My_fontsize: 20,
                text_1: container_title,
                text_color: const Color.fromARGB(255, 255, 255, 255),
              ),
              const SizedBox(
                width: Car_Card_Constant.distance_between_card_parts,
              ),
              My_textstyle(
                My_fontsize: 20,
                text_1: container_action,
                text_color: Car_Card_Constant.fontcolor,
              ),
            ],
          ),
        ),
      ],
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
