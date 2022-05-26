import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kGreySecondaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  'Menu',
                  style: kPrimaryFontStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MenuWidget(
                        function: () {
                          Get.toNamed('/full-quran');
                        },
                        title: 'Baca Al-Qur\'an',
                        image: 'assets/icons/book.png',
                        subTitle: 'Baca dan Dengarkan',
                        isChoose: true,
                      ),
                      MenuWidget(
                        function: () {},
                        image: 'assets/icons/pray.png',
                        title: 'Jadwal Shalat',
                        subTitle: 'Jadwal shalat lengkap',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      MenuWidget(
                        function: () {},
                        title: 'Qiblat',
                        image: 'assets/icons/compas.png',
                        subTitle: 'Cari qiblat',
                      ),
                      MenuWidget(
                        function: () {},
                        image: 'assets/icons/support.png',
                        title: 'Support',
                        subTitle: 'Support developer',
                      ),
                    ],
                  ),
                ],
              )
              // GridView(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   scrollDirection: Axis.vertical,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //   ),
              //   children: const [MenuWidget(), MenuWidget(), MenuWidget(), MenuWidget()],
              // )
            ],
          ),
        ));
  }
}

class MenuWidget extends StatelessWidget {
  final bool isChoose;
  final String image;
  final String title;
  final String subTitle;
  final Function function;

  const MenuWidget(
      {Key? key,
      this.isChoose = false,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 70,
        width: Get.width / 2 - 24 - 10 - 4,
        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isChoose ? kSecondaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: kPrimaryFontStyle.copyWith(color: isChoose ? Colors.white : kBlackColor),
                ),
                Text(
                  subTitle,
                  style: kPrimaryFontStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: isChoose ? Colors.white70 : Colors.black54),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
