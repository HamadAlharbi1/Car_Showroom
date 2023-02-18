import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../contents/Homepage_contents/Car_Card.dart';
import '../contents/modols.dart';
import '../loginpages/navigator.dart';
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
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('تعديل البيانات'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        height: Car_Card_Constant.photo_Box_w,
                        width: Car_Card_Constant.photo_Box_w,
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
                    Choose_from_the_list(
                      title_of_list: 'نوع الشركة المصنعة',
                      defult_Type: selecteditrrm,
                      array_of_items: const ['Toyota', 'KIA', 'Honda'],
                    ),
                    const Choose_from_the_list(
                      title_of_list: ' سنة الصنع',
                      defult_Type: '2023',
                      array_of_items: ['2023', '2022', '2021'],
                    ),
                    const Choose_from_the_list(
                      title_of_list: ' انتهاء التأمين',
                      defult_Type: '2023',
                      array_of_items: ['2023', '2022', '2021'],
                    ),
                    const Choose_from_the_list(
                      title_of_list: ' انتهاء الاستمارة',
                      defult_Type: '2023',
                      array_of_items: ['2023', '2024', '2025'],
                    ),
                    text_field_container(
                      Controller: _priceController,
                      textfield_content: 'السعر',
                      title_for_textfield: 'سعرالمركبة',
                    ),
                    text_field_container(
                      Controller: _pNumberController,
                      textfield_content: 'رقم اللوحة',
                      title_for_textfield: 'ادخل لوحة المركبة',
                    ),
                    text_field_container(
                      Controller: _parkingNumberController,
                      textfield_content: 'رقم موقف السيارة',
                      title_for_textfield: 'ادخل رقم الموقف',
                    ),
                  ],
                ),
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
                            color: const Color.fromARGB(255, 50, 16, 130),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              My_textstyle(text_1: 'حفظ التعديلات', text_color: Car_Card_Constant.fontcolor),
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
                            title: const Text(
                              ' هل تم بيع هذه السياره ؟ ',
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 130, 16, 16),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      FirebaseFirestore.instance.collection('showroom').doc(widget.car.id).delete();
                                    },
                                    child: const Text('نعم'),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 130, 16, 16),
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
                            backgroundColor: const Color.fromARGB(255, 64, 64, 64),
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
                              My_textstyle(text_1: 'ازالة هذه السياره', text_color: Car_Card_Constant.fontcolor),
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



/**
 * 
 *    TextFormField(
                      controller: _sellernameController, 
                      decoration: const InputDecoration(labelText: 'المالك'),
                    ),
                    const SizedBox(height: 16),
                // النوع
                    TextFormField(
                      controller: _nameController, 
                      decoration: const InputDecoration(labelText: 'النوع'),
                    ),
                    const SizedBox(height: 16),
             // السعر
                    TextFormField(
                      controller: _priceController, //
                      decoration: const InputDecoration(labelText: 'السعر'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _modelController, //
                      decoration: const InputDecoration(labelText: 'الموديل'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _pNumberController, //
                      decoration: const InputDecoration(labelText: 'رقم اللوحة'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _insuranceController, //
                      decoration: const InputDecoration(labelText: 'تاريخ انتهاء التأمين'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _plateNumberController, //
                      decoration: const InputDecoration(labelText: 'رقم موقف السيارة'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _licenseStatusController, //
                      decoration: const InputDecoration(labelText: 'حالة الترخيص'),
                    ),
                    const SizedBox(height: 32),
                
 */