import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../loginpages/navigator.dart';

class NewCar extends StatefulWidget {
  const NewCar({
    Key? key,
  }) : super(key: key);

  @override
  State<NewCar> createState() => _NewCarState();
}

class _NewCarState extends State<NewCar> {
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
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('اضافة سياره'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ElevatedButton(
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
                      child: const Text('Upload imagee'),
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'النوع',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'السعر',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _modelController,
                      decoration: const InputDecoration(
                        labelText: 'الموديل',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _pNumberController,
                      decoration: const InputDecoration(
                        labelText: 'رقم اللوحة',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _insuranceController,
                      decoration: const InputDecoration(
                        labelText: 'تاريخ انتهاء التأمين',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _parkingNumberController,
                      decoration: const InputDecoration(
                        labelText: 'رقم موقف السيارة',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _licenseStatusController,
                      decoration: const InputDecoration(
                        labelText: 'تاريخ انتهاء رخصة سير المركبة -الاستمارة-',
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final CollectionReference collectionRef = FirebaseFirestore.instance.collection('showroom');

// Create a new document in the collection
                  collectionRef
                      .add({
                        'sellername': '',
                        'id': '',
                        'P_number': _parkingNumberController.text,
                        'plate_number': _pNumberController.text,
                        'Insurance': _insuranceController.text,
                        'licensestatus': _licenseStatusController.text,
                        'Model': _modelController.text,
                        'Price': _priceController.text,
                        'image':
                            'https://img4cdn.haraj.com.sa/userfiles30/2023-02-15/800x515-1_-GO__MTY3NjQ0NTk5NDEwMDA2MTI2NTM3Mg.jpg',
                        'name': _nameController.text,
                      })
                      .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const navigationBar(),
                            ),
                          ))
                      .catchError((error) => print('Failed to add document: $error'));
                },
                child: const Text('حفظ '),
              ),
            ],
          ),
        ));
  }
}
