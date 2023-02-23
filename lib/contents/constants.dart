import 'package:flutter/material.dart';

import '../Homepage_contents/Car_Card.dart';

class Car_Card_Constant {
  static const fontcolor = Color.fromARGB(255, 181, 181, 181);
  static const fontcolor2 = Color.fromARGB(255, 254, 254, 254);
  static const containercolor = Color.fromARGB(255, 63, 108, 147);
  static const title_container_color = Color.fromARGB(255, 151, 157, 161);
  static const double photo_Box_h = 150;
  static const double photo_Box_w = 200;
  static const double distance_between_card_parts = 12;
  static const double textcontainer_w = 160;
  static const double icon_container_w = 35;
  static const double report_container_w = 120;
  static const double textfield_container_w = 88;
  static const double parking_container_h = 60;
  static const double fontsize1 = 16;
  static const double fontsize2 = 12;
  static const double fontsize32 = 32;
  static const double fontsize16 = 16;
  static const double fontsize20 = 20;
  static const double hight32 = 32;
  static const double hight16 = 16;
  static const dynamic textstyle = TextStyle(color: Colors.white);
}



class My_textstyle extends StatelessWidget {
  final double My_fontsize;
  final String text_1;
  final Color text_color;

  const My_textstyle({
    Key? key,
    required this.text_1,
    required this.text_color,
    this.My_fontsize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_1,
      style: TextStyle(
        color: text_color,
        fontSize: My_fontsize,
      ),
    );
  }
}


class My_textstyle2 extends StatelessWidget {
  final String text_1;
  final Color text_color;
  const My_textstyle2({
    Key? key,
    required this.text_1,
    required this.text_color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_1,
      style: TextStyle(color: text_color, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class Row_container_title extends StatelessWidget {
  final String text_content;
  const Row_container_title({Key? key, required this.text_content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Car_Card_Constant.textcontainer_w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Car_Card_Constant.containercolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          My_textstyle(text_1: text_content, text_color: Car_Card_Constant.fontcolor),
        ],
      ),
    );
  }
}

class My_textstyle22 extends StatelessWidget {
  final String text_1;
  final Color text_color;
  const My_textstyle22({Key? key, required this.text_1, required this.text_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_1,
      style: TextStyle(color: text_color, fontSize: Car_Card_Constant.fontsize2),
    );
  }
}

class Row_container_Content extends StatelessWidget {
  final String text_content;
  const Row_container_Content({Key? key, required this.text_content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Car_Card_Constant.textcontainer_w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 212, 212, 212),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          My_textstyle22(text_1: text_content, text_color: const Color.fromARGB(255, 0, 0, 0)),
        ],
      ),
    );
  }
}

class sections_Of_reports extends StatelessWidget {
  final String title;
  const sections_Of_reports({Key? key, required this.title}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              My_textstyle2(
                text_1: title,
                text_color: Car_Card_Constant.containercolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class content_of_sections_Of_reports extends StatelessWidget {
  final String title;
  const content_of_sections_Of_reports({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: Car_Card_Constant.report_container_w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Car_Card_Constant.containercolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          My_textstyle2(
            text_1: title,
            text_color: Car_Card_Constant.fontcolor,
          )
        ],
      ),
    );
  }
}

class middle_image extends StatelessWidget {
  const middle_image({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Car_Card widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: Car_Card_Constant.photo_Box_h,
      width: Car_Card_Constant.photo_Box_w,
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        widget.i.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
