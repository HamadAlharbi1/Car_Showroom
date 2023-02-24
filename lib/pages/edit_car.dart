import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/constants.dart';
import '../contents/modols.dart';
import 'navigator.dart';
import 'newcar.dart';

class EditCar extends StatefulWidget {
  final Car car;

  const EditCar({Key? key, required this.car}) : super(key: key);

  @override
  State<EditCar> createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  final selecteditrrm = 'Toyota';
  final TextEditingController _parkingNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sellernameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _pNumberController = TextEditingController();
  final TextEditingController _insuranceController = TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _licenseStatusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.car.name;
    _sellernameController.text = widget.car.sellername;
    _priceController.text = widget.car.Price;
    _modelController.text = widget.car.Model;
    _pNumberController.text = widget.car.P_number;
    _insuranceController.text = widget.car.Insurance;
    _plateNumberController.text = widget.car.P_number;
    _licenseStatusController.text = widget.car.licensestatus;
  }

  _updateCar() async {
    try {
      DocumentReference carRef = FirebaseFirestore.instance.collection('showroom').doc(widget.car.id);
      carRef.update({
        'name': _nameController.text, //
        'sellername': _sellernameController.text, //
        'Price': _priceController.text, //
        'Model': _modelController.text, //
        'parknumber': _pNumberController.text, //
        'Insurance': _insuranceController.text, //
        'plate_number': _plateNumberController.text, //
        'licensestatus': _licenseStatusController.text, //
      });
    } catch (error) {
      print('Failed to update car: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('تعديل البيانات'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: Colors_and_Dimentions.photo_Box_w,
                  width: Colors_and_Dimentions.photo_Box_w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.network(
                    widget.car.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              const Choose_from_the_list(
                title_of_list: ' انتهاء التأمين',
                defult_Type: '2023',
              ),
              const Choose_from_the_list(
                title_of_list: ' انتهاء الاستمارة',
                defult_Type: '2023',
              ),
              text_field_container(
                Controller: _priceController,
                textfield_content: 'السعر',
                title_for_textfield: 'سعرالمركبة',
              ),
              text_field_container(
                Controller: _parkingNumberController,
                textfield_content: 'رقم موقف السيارة',
                title_for_textfield: 'ادخل رقم الموقف',
              ),
              const SizedBox(
                height: Colors_and_Dimentions.fontsize32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      _updateCar();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const navigationBar(),
                        ),
                      );
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
                              My_textstyle(text_1: 'حفظ التعديلات', text_color: Colors_and_Dimentions.fontcolor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const navigationBar(),
                                        ),
                                      );
                                      FirebaseFirestore.instance.collection('showroom').doc(widget.car.id).delete();
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
                              ' هل تريد ازالة هذه السيارة ؟ ',
                              style: TextStyle(color: Colors_and_Dimentions.containercolor),
                            ),
                            backgroundColor: Colors_and_Dimentions.title_container_color,
                          );
                        },
                      );

                      setState(() {});
                    }),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 130, 16, 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              My_textstyle(text_1: 'ازالة هذه السياره', text_color: Colors_and_Dimentions.fontcolor),
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
        ));
  }
}
