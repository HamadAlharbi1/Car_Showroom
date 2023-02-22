import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project4/contents/modols.dart';

import '../contents/constants.dart';

class Order_Card extends StatefulWidget {
  const Order_Card({
    Key? key,
  }) : super(key: key);

  @override
  State<Order_Card> createState() => _Car_CardState();
}

class _Car_CardState extends State<Order_Card> {
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
                    for (var order in Data.orders1)
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
