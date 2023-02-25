import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/constants.dart';
import '../contents/modols.dart';
import 'Homepage.dart';
import 'add_order.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int count = 0;
  int Deletedorders = 0;
  int work_in_progress = 0;

  int total_P = 20;
  int get available_P => total_P - count - 2;
  int get new_id => count + 1;
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
    listenTopending();
    listenTodeleted_orders();
    listenTowork_in_progress();
  }

  listenTopending() {
    FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      setState(() {
        count = collection.size;
      });
    });
  }

  listenToDeletedorders() {
    FirebaseFirestore.instance.collection('deleted_orders').snapshots().listen((collection) {
      setState(() {
        Deletedorders = collection.size;
      });
    });
  }

  listenTowork_in_progress() {
    FirebaseFirestore.instance.collection('work_in_progress').snapshots().listen((collection) {
      setState(() {
        work_in_progress = collection.size;
      });
    });
  }

// work_in_progress
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
  final TextEditingController _V_modelController = TextEditingController();
  final TextEditingController _V_colorController = TextEditingController();
  final TextEditingController _V_typeController = TextEditingController();
  final TextEditingController _phone_numberController = TextEditingController();
  final TextEditingController _customer_nameController = TextEditingController();

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
                                for (var order in deleted_orders) Deleted_Oreders(order: order),
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
                    available_P: Deletedorders,
                    imageUrl: 'https://thumbs.dreamstime.com/b/cancel-agreement-icon-189052111.jpg',
                  ),
                ),
                head_title_icon(
                  container_action: 'قيد التنفيذ',
                  available_P: work_in_progress,
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
                                      style: TextStyle(color: Colors_and_Dimentions.containercolor),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          text_field_container(
                                            Controller: _V_modelController,
                                            textfield_content: 'المديل',
                                            title_for_textfield: 'مديل السيارة',
                                          ),
                                          text_field_container(
                                            Controller: _V_colorController,
                                            textfield_content: 'اللون',
                                            title_for_textfield: 'لون السياره',
                                          ),
                                          text_field_container(
                                            Controller: _V_typeController,
                                            textfield_content: 'نوع السيارة',
                                            title_for_textfield: 'ادخل نوع السيارة',
                                          ),
                                          text_field_container(
                                            Controller: _phone_numberController,
                                            textfield_content: 'رقم الجوال',
                                            title_for_textfield: 'ادخل رقم الجوال',
                                          ),
                                          text_field_container(
                                            Controller: _customer_nameController,
                                            textfield_content: 'اسم العميل ',
                                            title_for_textfield: 'ادخل اسم العميل ',
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              final CollectionReference collectionRef =
                                                  FirebaseFirestore.instance.collection('orders');

                                              collectionRef
                                                  .doc(new_id.toString())
                                                  .set({
                                                    'V_model': _V_modelController.text,
                                                    'id': new_id.toString(),
                                                    'V_color': _V_colorController.text,
                                                    'V_type': _V_typeController.text,
                                                    'phone_number': _phone_numberController.text,
                                                    'customer_name': _customer_nameController.text,
                                                  })
                                                  .then((value) => Navigator.pop(context))
                                                  .catchError((error) => print('Failed to add document: $error'));
                                            },
                                            child: Container(
                                              width: Colors_and_Dimentions.textcontainer_w,
                                              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors_and_Dimentions.containercolor,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: const [
                                                  My_textstyle(
                                                      text_1: "حفظ", text_color: Colors_and_Dimentions.fontcolor),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    backgroundColor: Colors_and_Dimentions.title_container_color,
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
                            for (var i in Data.reports1)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    FirebaseFirestore.instance
                                        .collection(i.saler_name.toString())
                                        .doc(widget.order.id)
                                        .set(widget.order.toMap());
                                    FirebaseFirestore.instance.collection('orders').doc(widget.order.id).delete();
                                    FirebaseFirestore.instance.collection('work_in_progress').doc(widget.order.id).set({
                                      'sellername': i.saler_name.toString(),
                                      'customer_name': widget.order.customer_name, //
                                      'phone_number': widget.order.phone_number, //
                                      'V_color': widget.order.V_color, //
                                      'V_type': widget.order.V_type,
                                      'id': widget.order.id,
                                      'V_model': widget.order.V_model,
                                    });
                                  });
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        width: Colors_and_Dimentions.saler_name_w,
                                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors_and_Dimentions.containercolor,
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            My_textstyle(
                                              text_1: i.saler_name.toString(),
                                              text_color: Colors_and_Dimentions.title_container_color,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            const SizedBox(
                              height: Colors_and_Dimentions.distance_between_card_parts,
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

class Deleted_Oreders extends StatefulWidget {
  const Deleted_Oreders({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order_detail_1 order;

  @override
  State<Deleted_Oreders> createState() => _Deleted_OredersState();
}

class _Deleted_OredersState extends State<Deleted_Oreders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (() {
                  setState(() {});
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
                                  setState(() {
                                    Navigator.pop(context);

                                    FirebaseFirestore.instance
                                        .collection('deleted_orders')
                                        .doc(widget.order.id)
                                        .delete();
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
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
