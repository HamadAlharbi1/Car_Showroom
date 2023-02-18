import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../contents/constants.dart';
import 'Login.dart';
import 'navigator.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'اضافة سياره',
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 23, 24, 24),
                      ),
                      child: const Text(
                        'English',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 100),
            Center(
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.network(
                      'data:image/png;base64,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',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: Constant.hight32),
                  const Text(
                    'شقردي',
                    style: TextStyle(
                        color: Constant.fontcolor, fontSize: Constant.fontsize32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: Constant.hight16,
                  ),
                  const Text(
                    'شقردي يوصل لك اي شي',
                    style: TextStyle(
                        color: Constant.fontcolor, fontSize: Constant.fontsize16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: Constant.hight16),
                  // الايميل
                  Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 23, 24, 24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 300,
                            child: TextField(
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Email', hintStyle: TextStyle(color: Colors.white)),
                                controller: email,
                                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))))
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  //  كلمة المرور

                  Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 23, 24, 24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 300,
                            child: TextField(
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'password', hintStyle: TextStyle(color: Colors.white)),
                                controller: pass,
                                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))))
                      ],
                    ),
                  ),
                  const SizedBox(height: Constant.fontsize16),
                  // استمرار
                  InkWell(
                    onTap: () {
                      final Email = email.text; // في حالة التسجيل تستخدم هذا
                      final Pass = pass.text;
                      final user = FirebaseAuth.instance.createUserWithEmailAndPassword(email: Email, password: Pass);
                      if (user != null) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      } else {
                        print('result $user');
                      }
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 62, 62, 62),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'تسجيل',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Constant.fontsize16),
                  const Text(
                    'أو',
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: Constant.fontsize16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const navigationBar(
                                // value: resturants,
                                )),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 28, 28, 28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'متابعة بدون تسجيل ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 253, 253),
                                fontSize: Constant.fontsize16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Constant.fontsize16),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 151, 151, 151))),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
