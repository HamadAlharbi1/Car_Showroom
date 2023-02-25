import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project4/pages/orders.dart';

import '../contents/constants.dart';
import 'navigator.dart';
import 'newcar.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({
    Key? key,
  }) : super(key: key);
  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final TextEditingController _V_modelController = TextEditingController();
  final TextEditingController _V_colorController = TextEditingController();
  final TextEditingController _V_typeController = TextEditingController();
  final TextEditingController _phone_numberController = TextEditingController();
  final TextEditingController _customer_nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 12,
          ),
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
            textfield_content: 'المالك',
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
              final CollectionReference collectionRef = FirebaseFirestore.instance.collection('orders');

// Create a new document in the collection
              collectionRef
                  .add({
                    'V_model': _V_modelController.text,
                    'id': '',
                    'V_color': _V_colorController.text,
                    'V_type': _V_typeController.text,
                    'phone_number': _phone_numberController.text,
                    'customer_name': _customer_nameController.text,
                  })
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Orders(),
                        ),
                      ))
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
                  My_textstyle(text_1: "حفظ", text_color: Colors_and_Dimentions.fontcolor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
