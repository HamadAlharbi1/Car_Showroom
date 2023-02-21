import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/modols.dart';

class Order_Card extends StatefulWidget {
  const Order_Card({
    Key? key,
  }) : super(key: key);

  @override
  State<Order_Card> createState() => _Car_CardState();
}

class _Car_CardState extends State<Order_Card> {
  List<Order_detail_1> orderss = [];
  @override
  void initState() {
    super.initState();
    listenToOrdars();
  }

  listenToOrdars() {
    FirebaseFirestore.instance.collection('orders').snapshots().listen((collection) {
      List<Order_detail_1> newList = [];
      for (final doc in collection.docs) {
        final order = Order_detail_1.fromMap(doc.data());
        newList.add(order);
      }
      orderss = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var orders1;
    return Container(
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
                      color: Car_Card_Constant2.containercolor,
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
                    for (var order in Data_showroom.orders1)
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
    );
  }
}

class Row_container_title extends StatelessWidget {
  final String text_content;
  const Row_container_title({Key? key, required this.text_content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Car_Card_Constant2.textcontainer_w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Car_Card_Constant2.containercolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          My_textstyle(text_1: text_content, text_color: Car_Card_Constant2.fontcolor),
        ],
      ),
    );
  }
}

class My_textstyle extends StatelessWidget {
  final String text_1;
  final Color text_color;
  const My_textstyle({Key? key, required this.text_1, required this.text_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_1,
      style: TextStyle(color: text_color, fontSize: Car_Card_Constant2.fontsize1),
    );
  }
}

class My_textstyle22 extends StatelessWidget {
  final String text_1;
  final Color text_color;
  const My_textstyle22({Key? key, required this.text_1, required this.text_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_1,
      style: TextStyle(color: text_color, fontSize: Car_Card_Constant2.fontsize2),
    );
  }
}

class Car_Card_Constant2 {
  static const fontcolor = Color.fromARGB(255, 181, 181, 181);
  static const fontcolor2 = Color.fromARGB(255, 185, 93, 255);
  static const containercolor = Color.fromARGB(255, 16, 96, 130);
  static const title_container_color = Color.fromARGB(255, 151, 157, 161);
  static const double photo_Box_h = 150;
  static const double photo_Box_w = 200;
  static const double distance_between_card_parts = 12;
  static const double textcontainer_w = 100;
  static const double icon_container_w = 80;
  static const double textfield_container_w = 88;
  static const double fontsize2 = 12;
  static const double fontsize1 = 16;
}

class Row_container_Content extends StatelessWidget {
  final String text_content;
  const Row_container_Content({Key? key, required this.text_content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Car_Card_Constant2.textcontainer_w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 212, 212, 212),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const My_textstyle(text_1: '', text_color: Car_Card_Constant.fontcolor2),
          // const My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),

          My_textstyle22(text_1: text_content, text_color: const Color.fromARGB(255, 0, 0, 0)),
        ],
      ),
    );
  }
}
