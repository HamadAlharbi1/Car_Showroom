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
  int count2 = 0;
  int total_P = 20;
  int get available_P => total_P - count - 2;
  StreamSubscription? listener;
  StreamSubscription? listener2;
  List<Order_detail_1> orders = []; //deleted_orders
  List<Order_detail_1> deleted_orders = [];
  @override
  void initState() {
    listener?.cancel();
    listener2?.cancel();
    super.initState();
    listenTocars();
    listenToDeletedorders();
    listenTolength();
    listenTodeleted_orders();
  }

  listenTolength() {
    FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      setState(() {
        count = collection.size;
      });
    });
  }

  listenToDeletedorders() {
    FirebaseFirestore.instance.collection('deleted_orders').snapshots().listen((collection) {
      setState(() {
        count2 = collection.size;
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

  listenTodeleted_orders() {
    listener2 ??= FirebaseFirestore.instance.collection('deleted_orders').snapshots().listen((collection) {
      List<Order_detail_1> newList = [];
      for (final doc in collection.docs) {
        final car = Order_detail_1.fromMap(doc.data());
        newList.add(car);
      }
      deleted_orders = newList;
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
              height: Colors_and_Dimentions.photo_Box_h,
              width: Colors_and_Dimentions.photo_Box_w,
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
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'الطلبات المهمله  ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          actions: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Row_container_title(
                                      text_content: 'الموديل',
                                    ),
                                    Row_container_title(
                                      text_content: 'اللون',
                                    ),
                                    Row_container_title(
                                      text_content: 'نوع المركبة',
                                    ),
                                    Row_container_title(
                                      text_content: 'رقم الجوال ',
                                    ),
                                    Row_container_title(
                                      text_content: 'اسم العميل',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                for (var order in deleted_orders) ordercard(order: order),
                              ],
                            ),
                          ],
                          backgroundColor: const Color.fromARGB(255, 104, 104, 104),
                        );
                      },
                    );
                  },
                  child: head_title_icon(
                    container_action: 'الطلبات المهمله ',
                    available_P: count2,
                    imageUrl: 'https://thumbs.dreamstime.com/b/cancel-agreement-icon-189052111.jpg',
                  ),
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
                                  return AlertDialog(
                                    title: const Text(
                                      'اضافة طلب جديد   ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: const [
                                          Row_container_title(
                                            text_content: 'الموديل',
                                          ),
                                          Row_container_title(
                                            text_content: 'اللون',
                                          ),
                                          Row_container_title(
                                            text_content: 'نوع المركبة',
                                          ),
                                          Row_container_title(
                                            text_content: 'رقم الجوال ',
                                          ),
                                          Row_container_title(
                                            text_content: 'اسم العميل',
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
                              Icons.add,
                              color: Colors_and_Dimentions.containercolor,
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
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  FirebaseFirestore.instance
                                      .collection('Mohammed')
                                      .doc(widget.order.id)
                                      .set(widget.order.toMap());
                                  FirebaseFirestore.instance.collection('orders').doc(widget.order.id).delete();
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: Colors_and_Dimentions.showdialog_bottom_w,
                                  padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors_and_Dimentions.containercolor,
                                  ),
                                  child: const My_textstyle(
                                    text_1: 'محمد',
                                    text_color: Colors_and_Dimentions.title_container_color,
                                  )),
                            ),
                            const SizedBox(
                              height: Colors_and_Dimentions.distance_between_card_parts,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                FirebaseFirestore.instance
                                    .collection('abdullah')
                                    .doc(widget.order.id)
                                    .set(widget.order.toMap());
                                FirebaseFirestore.instance.collection('order').doc(widget.order.id).delete();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: Colors_and_Dimentions.showdialog_bottom_w,
                                  padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors_and_Dimentions.containercolor,
                                  ),
                                  child: const My_textstyle(
                                    text_1: 'عبدالله',
                                    text_color: Colors_and_Dimentions.title_container_color,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  title: const Text(
                    ' قم بتوجيه الطلب لاحد مستشاري المبيعات  ',
                    style: TextStyle(color: Colors_and_Dimentions.containercolor),
                  ),
                  backgroundColor: Colors_and_Dimentions.title_container_color,
                );
              },
            );
          },
          child: Row(
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
                                    FirebaseFirestore.instance
                                        .collection('deleted_orders')
                                        .doc(widget.order.id)
                                        .set(widget.order.toMap());
                                    FirebaseFirestore.instance.collection('orders').doc(widget.order.id).delete();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: Colors_and_Dimentions.showdialog_bottom_w,
                                      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors_and_Dimentions.containercolor,
                                      ),
                                      child: const My_textstyle(
                                        text_1: 'نعم',
                                        text_color: Colors_and_Dimentions.title_container_color,
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: Colors_and_Dimentions.showdialog_bottom_w,
                                      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors_and_Dimentions.containercolor,
                                      ),
                                      child: const My_textstyle(
                                        text_1: 'لا',
                                        text_color: Colors_and_Dimentions.title_container_color,
                                      )),
                                ),
                              ],
                            ),
                          ],
                          title: const Text(
                            'هل تريد ازالة هذا الطلب  ',
                            style: TextStyle(color: Colors_and_Dimentions.containercolor),
                          ),
                          backgroundColor: Colors_and_Dimentions.title_container_color,
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
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
