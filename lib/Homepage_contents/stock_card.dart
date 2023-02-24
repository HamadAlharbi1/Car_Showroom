import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../pages/cardetailsss.dart';
import '../../../pages/edit_car.dart';
import '../contents/constants.dart';
import '../contents/modols.dart';

class Stok_card extends StatefulWidget {
  const Stok_card({
    Key? key,
    required this.i,
  }) : super(key: key);

  final Car i;

  @override
  State<Stok_card> createState() => _Car_CardState();
}

class _Car_CardState extends State<Stok_card> {
  final TextEditingController _pNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _pNumberController.text = widget.i.P_number;
  }

  _updateCar() async {
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
                      width: Colors_and_Dimentions.textcontainer_w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors_and_Dimentions.containercolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          My_textstyle(text_1: widget.i.P_number, text_color: Colors_and_Dimentions.fontcolor2),
                          const My_textstyle(text_1: ' ', text_color: Colors_and_Dimentions.fontcolor),
                          const My_textstyle(text_1: 'الموقف', text_color: Colors_and_Dimentions.fontcolor),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Colors_and_Dimentions.distance_between_card_parts,
                    ),
                    Container(
                      width: Colors_and_Dimentions.textcontainer_w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors_and_Dimentions.containercolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          My_textstyle(text_1: widget.i.plate_number, text_color: Colors_and_Dimentions.fontcolor2),
                          const My_textstyle(text_1: ' ', text_color: Colors_and_Dimentions.fontcolor),
                          const My_textstyle(text_1: 'اللوحة', text_color: Colors_and_Dimentions.fontcolor),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Colors_and_Dimentions.distance_between_card_parts,
                    ),
                    Container(
                      width: Colors_and_Dimentions.textcontainer_w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors_and_Dimentions.containercolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          My_textstyle(text_1: widget.i.sellername, text_color: Colors_and_Dimentions.fontcolor2),
                          const My_textstyle(text_1: ' ', text_color: Colors_and_Dimentions.fontcolor),
                          const My_textstyle(text_1: 'المالك ', text_color: Colors_and_Dimentions.fontcolor),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  height: Colors_and_Dimentions.photo_Box_h,
                  width: Colors_and_Dimentions.photo_Box_w,
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
                                ' هل تريد تعديل معلومات المركبة ',
                                style: TextStyle(color: Colors_and_Dimentions.containercolor),
                              ),
                              backgroundColor: Colors_and_Dimentions.title_container_color,
                            );
                          },
                        );
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
                            My_textstyle(text_1: 'تعديل', text_color: Colors_and_Dimentions.fontcolor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Colors_and_Dimentions.distance_between_card_parts,
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
                        width: Colors_and_Dimentions.textcontainer_w,
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors_and_Dimentions.containercolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            My_textstyle(text_1: 'معلومات السياره', text_color: Colors_and_Dimentions.fontcolor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Colors_and_Dimentions.distance_between_card_parts,
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
                                                  color: Colors_and_Dimentions.containercolor,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: const [
                                                    My_textstyle(
                                                        text_1: 'ليس الان ',
                                                        text_color: Colors_and_Dimentions.fontcolor),
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
                                                  color: Colors_and_Dimentions.containercolor,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: const [
                                                    My_textstyle(
                                                        text_1: 'حفظ التعديلات',
                                                        text_color: Colors_and_Dimentions.fontcolor),
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
                                style: TextStyle(color: Colors_and_Dimentions.containercolor),
                              ),
                              backgroundColor: const Color.fromARGB(255, 151, 157, 161),
                            );
                          },
                        );

                        FirebaseFirestore.instance.collection('showroom').doc(widget.i.id).set(widget.i.toMap());
                        FirebaseFirestore.instance.collection('stock').doc(widget.i.id).delete();

                        setState(() {});
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
                            My_textstyle(text_1: ' الى صالة العرض', text_color: Colors_and_Dimentions.fontcolor),
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
