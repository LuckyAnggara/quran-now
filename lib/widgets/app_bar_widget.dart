import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback onPress;
  final Icon leftIcon;
  final List<Icon>? rightIcon;
  final String title;

  AppBarWidget(
      {Key? key,
      required this.onPress,
      required this.leftIcon,
      this.rightIcon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onPress,
            child: leftIcon,
          ),
          // const Icon(
          //   Icons.menu,
          // ),
          const Spacer(),
          Text(
            title,
            style: kPrimaryFontStyle,
          ),
          const Spacer(),
          Row(
              children: rightIcon!.map((e) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: e,
            );
          }).toList())
        ],
      ),
    );
  }
}
