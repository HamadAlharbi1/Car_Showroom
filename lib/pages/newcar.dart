import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../contents/constants.dart';
import 'navigator.dart';

class NewCar extends StatefulWidget {
  const NewCar({
    Key? key,
  }) : super(key: key);
  @override
  State<NewCar> createState() => _NewCarState();
}

class _NewCarState extends State<NewCar> {
  late String selectedItem = 'Choose from the list';
  final selecteditrrm = 'Toyota';
  final String A11 = 'الاستمارة';
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text('اضافة سياره'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    height: Colors_and_Dimentions.photo_Box_h,
                    width: Colors_and_Dimentions.photo_Box_w,
                    child: Image.network(
                      'https://smartermsp.com/wp-content/uploads/2019/08/shutterstock_214359349.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          try {
                            /// Pick an image
                            print('1: Pick an image');
                            final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

                            /// Return if user canceled
                            if (image == null) {
                              print('2: User canceled');
                              return;
                            }

                            /// Upload to firebase storage
                            print('3: Uploading...');
                            final ref = FirebaseStorage.instance.ref().child("bills/55/33.jpeg");
                            await ref.putFile(File(image.path));
                            final url = await ref.getDownloadURL();

                            print('4: Save in Firestore');
                            final profilesCollection = FirebaseFirestore.instance.collection('profile');
                            final userProfileDocument = profilesCollection.doc(FirebaseAuth.instance.currentUser?.uid);
                            userProfileDocument.set({'photo_url': url}, SetOptions(merge: true));
                          } catch (e) {
                            print('GG Upload error: $e');
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: Colors_and_Dimentions.textcontainer_w,
                              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors_and_Dimentions.containercolor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  My_textstyle(text_1: 'رفع صورة', text_color: Colors_and_Dimentions.fontcolor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Choose_from_the_list_2(
                    title_of_list: 'نوع الشركة المصنعة',
                    defult_Type: selecteditrrm,
                  ),
                  const Choose_from_the_list(
                    title_of_list: ' سنة الصنع',
                    defult_Type: '2023',
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
                    Controller: _pNumberController,
                    textfield_content: 'رقم اللوحة',
                    title_for_textfield: 'ادخل لوحة المركبة',
                  ),
                  text_field_container(
                    Controller: _nameController,
                    textfield_content: 'المالك',
                    title_for_textfield: 'ادخل اسم المالك',
                  ),
                  text_field_container(
                    Controller: _parkingNumberController,
                    textfield_content: 'رقم موقف السيارة',
                    title_for_textfield: 'ادخل رقم الموقف',
                  ),
                  TextButton(
                    onPressed: () {
                      final CollectionReference collectionRef = FirebaseFirestore.instance.collection('showroom');

// Create a new document in the collection
                      collectionRef
                          .add({
                            'sellername': _nameController.text,
                            'id': '',
                            'parknumber': _parkingNumberController.text,
                            'plate_number': _pNumberController.text,
                            'Insurance': '2024',
                            'licensestatus': '2025',
                            'Model': '2023',
                            'Price': _priceController.text,
                            'image':
                                'https://img4cdn.haraj.com.sa/userfiles30/2023-02-15/800x515-1_-GO__MTY3NjQ0NTk5NDEwMDA2MTI2NTM3Mg.jpg',
                            'name': 'Toyota',
                          })
                          .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const navigationBar(),
                                ),
                              ))
                          .catchError((error) => print('Failed to add document: $error'));

                      // try {
                      //   FirebaseFirestore.instance.collection('showroom').add({'Model': selectedItem});
                      //   // Show a success message to the user here
                      // } catch (error) {
                      //   // Show an error message to the user here
                      //   print('Error adding selected value to Firestore: $error');
                      // }
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
                          My_textstyle(text_1: "حفظ", text_color: Colors_and_Dimentions.fontcolor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class text_field_container extends StatelessWidget {
  final String textfield_content;
  final String title_for_textfield;
  const text_field_container({
    Key? key,
    required TextEditingController Controller,
    required this.title_for_textfield,
    required this.textfield_content,
  })  : _priceController = Controller,
        super(key: key);

  final TextEditingController _priceController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Colors_and_Dimentions.textcontainer_w,
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors_and_Dimentions.containercolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    My_textstyle(text_1: title_for_textfield, text_color: Colors_and_Dimentions.fontcolor),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Colors_and_Dimentions.textfield_container_w,
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: textfield_content,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Choose_from_the_list extends StatefulWidget {
  final String title_of_list;

  const Choose_from_the_list({Key? key, required this.defult_Type, required this.title_of_list}) : super(key: key);

  final String defult_Type;

  @override
  State<Choose_from_the_list> createState() => _Choose_from_the_listState();
}

class _Choose_from_the_listState extends State<Choose_from_the_list> {
  List<String> items = List.generate(10, (index) => (2025 - index).toString());
  String selectedItem = '2023';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Colors_and_Dimentions.textcontainer_w,
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors_and_Dimentions.containercolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    My_textstyle(text_1: widget.title_of_list, text_color: Colors_and_Dimentions.fontcolor),
                  ],
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            value: selectedItem,
          ),
        ],
      ),
    );
  }
}

class Choose_from_the_list_2 extends StatefulWidget {
  final String title_of_list;

  const Choose_from_the_list_2({Key? key, required this.defult_Type, required this.title_of_list}) : super(key: key);

  final String defult_Type;

  @override
  State<Choose_from_the_list_2> createState() => _Choose_from_the_listState_2();
}

class _Choose_from_the_listState_2 extends State<Choose_from_the_list_2> {
  List<String> items = [
    'Choose from the list',
    'Toyota',
    'General Motors',
    'Ford',
    'Honda',
    'Nissan',
    'Hyundai',
    'Kia',
    'Daimler',
    'BMW',
    'Tesla',
    'Fiat Chrysler Automobiles',
    'Renault-Nissan-Mitsubishi Alliance',
    'SAIC Motor',
    'Geely',
    'Subaru',
    'Mazda',
    'Volvo',
    'Porsche',
    'Ferrari',
    'Maserati',
    'Lamborghini'
  ];
  String selectedItem = 'Choose from the list';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Colors_and_Dimentions.textcontainer_w,
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors_and_Dimentions.containercolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    My_textstyle(text_1: widget.title_of_list, text_color: Colors_and_Dimentions.fontcolor),
                  ],
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            value: selectedItem,
          ),
        ],
      ),
    );
  }
}
