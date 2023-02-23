import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/constants.dart';
import '../contents/modols.dart';
import 'Homepage.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int count = 0;
  int total_P = 20;
  int get available_P => total_P - count - 2;
  StreamSubscription? listener;
  List<Order_detail_1> orders = [];
  @override
  void initState() {
    listener?.cancel();
    super.initState();
    listenTocars();

    listenTolength();
  }

  listenTolength() {
    FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      setState(() {
        count = collection.size;
      });
    });
  }

  listenTocars() {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                head_title_icon(
                  container_action: 'الطلبات الملغية',
                  available_P: available_P,
                  imageUrl: 'https://thumbs.dreamstime.com/b/cancel-agreement-icon-189052111.jpg',
                ),
                head_title_icon(
                  container_action: 'قيد التنفيذ',
                  available_P: total_P,
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/5038/5038308.png',
                ),
                head_title_icon(
                  container_action: '  عدد الطلبات ',
                  available_P: count,
                  imageUrl:
                      'https://image.shutterstock.com/image-vector/count-down-icon-isolated-on-260nw-265594496.jpg',
                ),
              ],
            ),

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
                            for (var order in orders) ordercard(order: order),
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

class ordercard extends StatefulWidget {
  const ordercard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order_detail_1 order;

  @override
  State<ordercard> createState() => _ordercardState();
}

class _ordercardState extends State<ordercard> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  FirebaseFirestore.instance.collection('orders').doc(widget.order.id).delete();
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: Car_Card_Constant.showdialog_bottom_w,
                                    padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Car_Card_Constant.containercolor,
                                    ),
                                    child: const My_textstyle(
                                      text_1: 'نعم',
                                      text_color: Car_Card_Constant.title_container_color,
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: Car_Card_Constant.showdialog_bottom_w,
                                    padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Car_Card_Constant.containercolor,
                                    ),
                                    child: const My_textstyle(
                                      text_1: 'لا',
                                      text_color: Car_Card_Constant.title_container_color,
                                    )),
                              ),
                            ],
                          ),
                        ],
                        title: const Text(
                          'هل تريد ازالة هذا الطلب  ',
                          style: TextStyle(color: Car_Card_Constant.containercolor),
                        ),
                        backgroundColor: Car_Card_Constant.title_container_color,
                      );
                    },
                  );
                }),
                child: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 181, 181, 181),
                )),
            Row_container_Content(
              text_content: widget.order.V_model, //الموديل
            ),
            Row_container_Content(
              text_content: widget.order.V_color, //'اللون'
            ),
            Row_container_Content(
              text_content: widget.order.V_type, //'نوع المركبة'
            ),
            Row_container_Content(
              text_content: widget.order.phone_number, //'رقم الجوال '
            ),
            Row_container_Content(
              text_content: widget.order.customer_name, //'اسم العميل'
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
