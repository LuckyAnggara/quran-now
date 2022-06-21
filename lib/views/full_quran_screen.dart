import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/controllers/quran/quran_controller.dart';
import 'package:qurannow/models/SuratModelAll.dart';
import 'package:qurannow/widgets/app_bar_widget.dart';

class FullQuranScreen extends StatelessWidget {
  FullQuranScreen({Key? key}) : super(key: key);

  final QuranController quranController =
      Get.put(QuranController(), tag: 'quranController');

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
                onPress: () {
                  Get.back();
                },
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
                      style: kPrimaryFontStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500),
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
                        style: kPrimaryFontStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
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
                                controller: quranController.scrollController,
                                separatorBuilder: (context, int) {
                                  return Divider();
                                },
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: quranController.pageSize.value,
                                itemBuilder: (context, index) {
                                  SuratModelAll surat =
                                      quranController.listSurat[index];
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
        Get.toNamed(
          '/read-quran/${surat.nomor}',
          arguments: {
            'number': surat.nomor,
            'name': surat.namaLatin,
            'translation': surat.arti,
            'revelation': surat.tempatTurun,
            'ayat': surat.jumlahAyat
          },
        );
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
                    surat.nomor.toString(),
                    style: kPrimaryFontStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surat.namaLatin!,
                        style: kPrimaryFontStyle.copyWith(
                            fontSize: 15, letterSpacing: 1.2),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        surat.arti!,
                        style: kSecondaryGreyFontStyle.copyWith(
                            fontSize: 13, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    surat.nama!,
                    style: kArabicFontAmiri.copyWith(
                        fontSize: 18, letterSpacing: 1.2),
                  ),
                  SizedBox(
                    width: 20,
                  ),
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
