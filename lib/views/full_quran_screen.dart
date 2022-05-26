import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/quran_controller.dart';
import 'package:qurannow/models/SuratModelAll.dart';
import 'package:qurannow/widgets/app_bar_widget.dart';

class FullQuranScreen extends StatelessWidget {
  FullQuranScreen({Key? key}) : super(key: key);

  final QuranController quranController = Get.put(QuranController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kSecondaryColor.withOpacity(1),
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
        backgroundColor: kPrimaryColor,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            children: [
              AppBarWidget(
                onPress: () {},
                leftIcon: Icon(Icons.arrow_back_ios),
                title: 'Al Qur\'an',
                rightIcon: [],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terakhir dibaca',
                      style: kPrimaryFontStyle.copyWith(fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 25,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return lastReadContainer();
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Surat',
                        style: kPrimaryFontStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Obx(() {
                          if (quranController.isLoading.value) {
                            return SpinKitWave(
                              color: kSecondaryColor,
                            );
                          } else {
                            return ListView.separated(
                                separatorBuilder: (context, int) {
                                  return Divider();
                                },
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: quranController.listSurat.length,
                                itemBuilder: (context, index) {
                                  SuratModelAll surat = quranController.listSurat[index];
                                  if (index == 2) {
                                    return listSurat(surat, true);
                                  }
                                  return listSurat(surat, false);
                                });
                          }
                        }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector listSurat(SuratModelAll surat, bool isBookmark) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/read-quran/${surat.number}');
      },
      child: InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    surat.number.toString(),
                    style: kPrimaryFontStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surat.name!.transliteration!.id!,
                        style: kPrimaryFontStyle.copyWith(fontSize: 13),
                      ),
                      Text(
                        surat.name!.translation!.id!,
                        style: kSecondaryGreyFontStyle.copyWith(fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    isBookmark ? Icons.bookmark : Icons.bookmark_outline,
                    color: kSecondaryColor,
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    isBookmark ? Icons.download : Icons.download,
                    color: kSecondaryColor,
                    size: 26,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Container lastReadContainer() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kSecondaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        'Al-Fatihah',
        style: kSecondaryGreyFontStyle.copyWith(fontSize: 12),
      ),
    );
  }
}
