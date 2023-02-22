import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/constants.dart';
import '../contents/modols.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  StreamSubscription? listener;
  List<Order_detail_1> orders = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();
  }

  void listenTocars() {
    listener ??= FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      List<Order_detail_1> newList = [];
      for (final doc in collection.docs) {
        final car = Order_detail_1.fromMap(doc.data());
        newList.add(car);
      }
      orders = newList;
      setState(() {});
    });
  }

  final selecteditrrm = 'Toyota';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _pNumberController = TextEditingController();
  final TextEditingController _insuranceController = TextEditingController();
  final TextEditingController _parkingNumberController = TextEditingController();
  final TextEditingController _licenseStatusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: 900,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: Car_Card_Constant.photo_Box_h,
              width: Car_Card_Constant.photo_Box_w,
              child: Image.network(
                'https://acena.com/wp-content/uploads/2015/01/Customer-on-Hold-For-Long-Periods-of-Time.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            // const Order_Card(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text(
                                      'اضافة طلب جديد   ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: [],
                                    backgroundColor: Color.fromARGB(255, 104, 104, 104),
                                  );
                                },
                              );

                              setState(() {});
                            }),
                            child: const Icon(
                              Icons.add,
                              color: Car_Card_Constant.containercolor,
                            ),
                          ),
                          const Row_container_title(
                            text_content: 'الموديل',
                          ),
                          const Row_container_title(
                            text_content: 'اللون',
                          ),
                          const Row_container_title(
                            text_content: 'نوع المركبة',
                          ),
                          const Row_container_title(
                            text_content: 'رقم الجوال ',
                          ),
                          const Row_container_title(
                            text_content: 'اسم العميل',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 800,
                        child: ListView(
                          children: [
                            for (final order in Data.orders1)
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: (() {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    'هل تريد ازالة هذا الطلب  ',
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        TextButton(
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              const Color.fromARGB(255, 16, 96, 130),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            FirebaseFirestore.instance
                                                                .collection('orders')
                                                                .doc(order.id)
                                                                .delete();
                                                          },
                                                          child: const Text('نعم'),
                                                        ),
                                                        TextButton(
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                              const Color.fromARGB(255, 16, 96, 130),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text('لا'),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                  backgroundColor: const Color.fromARGB(255, 104, 104, 104),
                                                );
                                              },
                                            );

                                            setState(() {});
                                          }),
                                          child: const Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(255, 181, 181, 181),
                                          )),
                                      Row_container_Content(
                                        text_content: order.V_model, //الموديل
                                      ),
                                      Row_container_Content(
                                        text_content: order.V_color, //'اللون'
                                      ),
                                      Row_container_Content(
                                        text_content: order.V_type, //'نوع المركبة'
                                      ),
                                      Row_container_Content(
                                        text_content: order.phone_number, //'رقم الجوال '
                                      ),
                                      Row_container_Content(
                                        text_content: order.customer_name, //'اسم العميل'
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
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
        ),
      )),
    );
  }
}
