import 'package:flutter/material.dart';

class Order_Card extends StatefulWidget {
  const Order_Card({
    Key? key,
  }) : super(key: key);

  @override
  State<Order_Card> createState() => _Car_CardState();
}

class _Car_CardState extends State<Order_Card> {
  final TextEditingController _pNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // _pNumberController.text = widget.i.P_number;
  }

  // _updateCar() async {
  //   try {
  //     DocumentReference carRef = FirebaseFirestore.instance.collection('stock').doc();
  //     carRef.update({
  //       'parknumber': _pNumberController.text, //
  //     });
  //   } catch (error) {
  //     print('Failed to update car: $error');
  //   }
  // }

  // _update_Parking_N() async {
  //   try {
  //     DocumentReference carRef = FirebaseFirestore.instance.collection('showroom').doc(widget.i.id);
  //     carRef.update({
  //       'parknumber': _pNumberController.text, //
  //     });
  //   } catch (error) {
  //     print('Failed to update car: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Row(
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
                                            // _update_Parking_N();
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
                        children: const [
                          My_textstyle(text_1: '', text_color: Car_Card_Constant.fontcolor2),
                          My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),
                          My_textstyle(text_1: 'الموقف', text_color: Car_Card_Constant.fontcolor),
                          Icon(
                            Icons.edit,
                            color: Car_Card_Constant.fontcolor,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Car_Card_Constant.distance_between_card_parts,
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
                      children: const [
                        My_textstyle(text_1: '', text_color: Car_Card_Constant.fontcolor2),
                        My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),
                        My_textstyle(text_1: 'اللوحة', text_color: Car_Card_Constant.fontcolor),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: Car_Card_Constant.distance_between_card_parts,
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
                      children: const [
                        My_textstyle(text_1: '', text_color: Car_Card_Constant.fontcolor2),
                        My_textstyle(text_1: ' ', text_color: Car_Card_Constant.fontcolor),
                        My_textstyle(text_1: 'المالك ', text_color: Car_Card_Constant.fontcolor),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
  static const double textfield_container_w = 88;

  static const double fontsize1 = 16;
}
//Car_Card_Constant.containercolor
//const Color.fromARGB(255, 151, 157, 161)