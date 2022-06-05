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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: Get.height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.width * .2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onPress,
                child: leftIcon,
              ),
            ),
          ),
          // const Icon(
          //   Icons.menu,
          // ),
          Spacer(),
          Text(
            title,
            style: kPrimaryFontStyle,
          ),
          Spacer(),
          SizedBox(
            width: Get.width * .2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: rightIcon!.map((e) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: e,
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
