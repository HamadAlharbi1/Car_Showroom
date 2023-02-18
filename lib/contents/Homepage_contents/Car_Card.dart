import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../pages/cardetailsss.dart';
import '../../pages/edit_car.dart';
import '../modols.dart';

class Car_Card extends StatefulWidget {
  const Car_Card({
    Key? key,
    required this.i,
  }) : super(key: key);

  final Car i;

  @override
  State<Car_Card> createState() => _Car_CardState();
}

class _Car_CardState extends State<Car_Card> {
  final TextEditingController _pNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _pNumberController.text = widget.i.P_number;
  }

  _updateCar() async {
    try {
      DocumentReference carRef = FirebaseFirestore.instance.collection('stock').doc(widget.i.id);
      carRef.update({
        'parknumber': _pNumberController.text, //
      });
    } catch (error) {
      print('Failed to update car: $error');
    }
  }

  _update_Parking_N() async {
    try {
      DocumentReference carRef = FirebaseFirestore.instance.collection('showroom').doc(widget.i.id);
      carRef.update({
        'parknumber': _pNumberController.text, //
      });
    } catch (error) {
      print('Failed to update car: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(61, 181, 181, 181),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Car_Card_Constant.textcontainer_w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Car_Card_Constant.containercolor,
                      ),
                      child: InkWell(
                        onTap: (() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  Column(
                                    children: [
                                      TextFormField(
                                        controller: _pNumberController, //
                                        decoration: const InputDecoration(labelText: ' '),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _update_Parking_N();
                                              Navigator.pop(context);
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Car_Card_Constant.containercolor,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: const [
                                                      My_textstyle(
                                                          text_1: 'حفظ التعديلات',
                                                          text_color: Car_Card_Constant.fontcolor),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                                title: const Text(
                                  'ادخل رقم الموقف الجديد',
                                  style: TextStyle(color: Car_Card_Constant.containercolor),
                                ),
                                backgroundColor: const Color.fromARGB(255, 151, 157, 161),
                              );
                            },
                          );
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            My_textstyle(text_1: widget.i.P_number, text_color: Car_Card_Constant.fontcolor2),
                            const My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),
                            const My_textstyle(text_1: 'الموقف', text_color: Car_Card_Constant.fontcolor),
                            const Icon(
                              Icons.edit,
                              color: Car_Card_Constant.fontcolor,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Car_Card_Constant.distance_between_card_parts,
                    ),
                    Container(
                      width: Car_Card_Constant.textcontainer_w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Car_Card_Constant.containercolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          My_textstyle(text_1: widget.i.plate_number, text_color: Car_Card_Constant.fontcolor2),
                          const My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),
                          const My_textstyle(text_1: 'اللوحة', text_color: Car_Card_Constant.fontcolor),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Car_Card_Constant.distance_between_card_parts,
                    ),
                    Container(
                      width: Car_Card_Constant.textcontainer_w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Car_Card_Constant.containercolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          My_textstyle(text_1: widget.i.sellername, text_color: Car_Card_Constant.fontcolor2),
                          const My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),
                          const My_textstyle(text_1: 'المالك ', text_color: Car_Card_Constant.fontcolor),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  height: Car_Card_Constant.photo_Box_h,
                  width: Car_Card_Constant.photo_Box_w,
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.i.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditCar(
                                                    car: widget.i,
                                                  )),
                                        );
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: Car_Card_Constant.icon_container_w,
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
                                          width: Car_Card_Constant.icon_container_w,
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
                                ' هل تريد تعديل معلومات المركبة ',
                                style: TextStyle(color: Car_Card_Constant.containercolor),
                              ),
                              backgroundColor: Car_Card_Constant.title_container_color,
                            );
                          },
                        );
                      },
                      child: Container(
                        width: Car_Card_Constant.textcontainer_w,
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Car_Card_Constant.containercolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            My_textstyle(text_1: 'تعديل', text_color: Car_Card_Constant.fontcolor),
                            Icon(
                              Icons.edit,
                              color: Car_Card_Constant.fontcolor,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Car_Card_Constant.distance_between_card_parts,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cardetailss(
                                    car: widget.i,
                                  )),
                        );
                      },
                      child: Container(
                        width: Car_Card_Constant.textcontainer_w,
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Car_Card_Constant.containercolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            My_textstyle(text_1: 'معلومات السياره', text_color: Car_Card_Constant.fontcolor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Car_Card_Constant.distance_between_card_parts,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                Column(
                                  children: [
                                    TextFormField(
                                      controller: _pNumberController, //
                                      decoration: const InputDecoration(labelText: ' '),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Car_Card_Constant.containercolor,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: const [
                                                    My_textstyle(
                                                        text_1: 'بعدين اعلمك ',
                                                        text_color: Car_Card_Constant.fontcolor),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _updateCar();
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Car_Card_Constant.containercolor,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: const [
                                                    My_textstyle(
                                                        text_1: 'حفظ التعديلات',
                                                        text_color: Car_Card_Constant.fontcolor),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                              title: const Text(
                                'في اي موقف بتوقفها ',
                                style: TextStyle(color: Car_Card_Constant.containercolor),
                              ),
                              backgroundColor: const Color.fromARGB(255, 151, 157, 161),
                            );
                          },
                        );

                        FirebaseFirestore.instance.collection('stock').doc(widget.i.id).set(widget.i.toMap());
                        FirebaseFirestore.instance.collection('showroom').doc(widget.i.id).delete();

                        setState(() {});
                      },
                      child: Container(
                        width: Car_Card_Constant.textcontainer_w,
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Car_Card_Constant.containercolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            My_textstyle(text_1: 'ارسال الى المستودع', text_color: Car_Card_Constant.fontcolor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
      style: TextStyle(color: text_color, fontSize: Car_Card_Constant.fontsize1),
    );
  }
}

class Car_Card_Constant {
  static const fontcolor = Color.fromARGB(255, 181, 181, 181);
  static const fontcolor2 = Color.fromARGB(255, 185, 93, 255);
  static const containercolor = Color.fromARGB(255, 16, 96, 130);
  static const title_container_color = Color.fromARGB(255, 151, 157, 161);
  static const double photo_Box_h = 150;
  static const double photo_Box_w = 200;
  static const double distance_between_card_parts = 12;
  static const double textcontainer_w = 160;
  static const double icon_container_w = 80;

  static const double fontsize1 = 16;
}
//Car_Card_Constant.containercolor
//const Color.fromARGB(255, 151, 157, 161)