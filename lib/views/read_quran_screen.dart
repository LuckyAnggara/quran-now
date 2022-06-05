import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qurannow/constant.dart';
import 'package:qurannow/models/SurahDetailModel.dart';
import 'package:qurannow/widgets/app_bar_widget.dart';

import '../controllers/read_quran_controller.dart';

class ReadQuranScreen extends StatelessWidget {
  ReadQuranScreen({Key? key}) : super(key: key);
  ReadQuranController readQuranController = Get.put(ReadQuranController());

  @override
  Widget build(BuildContext context) {
    readQuranController.fetchSurat(Get.arguments['number'].toString());

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            children: [
              AppBarWidget(
                onPress: () {
                  readQuranController.pauseAudio();
                  Get.back();
                },
                leftIcon: Icon(Icons.arrow_back_ios),
                title: Get.arguments['name'],
                // rightIcon: [
                //   Icon(Icons.bookmark_outline),
                //   Icon(Icons.settings_outlined),
                // ],
                rightIcon: [],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: Column(
                      children: [
                        CardDetailSurah(),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          if (readQuranController.isLoading.value) {
                            return Center(
                              child: SpinKitWave(
                                color: kSecondaryColor,
                              ),
                            );
                          } else {
                            var data = readQuranController.surat.value!.data![0];
                            var dataAudio = readQuranController.surat.value!.data![1];
                            var dataTranslate = readQuranController.surat.value!.data![2];

                            return Column(
                              children: List.generate(data.ayahs!.length, (index) {
                                return AyahWidget(
                                  onPlay: () {
                                    readQuranController.playAudio(
                                      dataAudio.ayahs![index].audio!,
                                      dataAudio.ayahs![index].numberInSurah!,
                                    );
                                  },
                                  ayah: data.ayahs![index],
                                  ayahTranslate: dataTranslate.ayahs![index],
                                );
                              }).toList(),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AyahWidget extends StatelessWidget {
  final Ayah ayah;
  final Ayah? ayahTranslate;
  final VoidCallback onPlay;

  final readQuranController = Get.find<ReadQuranController>();

  AyahWidget({
    required this.ayah,
    this.ayahTranslate,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: kSecondaryColorMoreBlack.withOpacity(0.15),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(45),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      ayah.numberInSurah!.toString(),
                      style: kPrimaryWhiteFontStyle,
                    ),
                  ),
                ),
                Spacer(),
                GetBuilder(
                    init: readQuranController,
                    id: 'updatePlay',
                    builder: (context) {
                      if (readQuranController.playIndex.toString() !=
                          ayah.numberInSurah.toString()) {
                        if (readQuranController.isStateLoadingAudio.value) {
                          return SpinKitWave(
                            color: kSecondaryColor,
                          );
                        } else {
                          return GestureDetector(
                            onTap: onPlay,
                            child: Icon(
                              Icons.play_circle_outline,
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      } else {
                        return GestureDetector(
                          onTap: () {
                            readQuranController.pauseAudio();
                          },
                          child: Icon(
                            Icons.pause_circle_filled,
                            color: kSecondaryColor,
                          ),
                        );
                      }
                    }),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.share_outlined,
                  color: kSecondaryColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              children: [
                //ARAB
                Container(
                  width: double.infinity,
                  child: Text(
                    ayah.text!,
                    textAlign: TextAlign.end,
                    style: kArabicFontAmiri.copyWith(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //Translate
                Container(
                  width: double.infinity,
                  child: Text(
                    ayahTranslate!.text!,
                    textAlign: TextAlign.start,
                    style: kPrimaryFontStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardDetailSurah extends StatelessWidget {
  const CardDetailSurah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [kSecondaryColor.withOpacity(0.8), kSecondaryColor],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Get.arguments['name'],
            style: kPrimaryWhiteFontStyle.copyWith(
                fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            Get.arguments['translation'],
            style: kPrimaryWhiteFontStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 1),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Get.arguments['revelation'],
                style: kPrimaryWhiteFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 1),
              ),
              Text(
                ' - ',
                style: kPrimaryWhiteFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 1),
              ),
              Text(
                '${Get.arguments['ayat']} Ayat',
                style: kPrimaryWhiteFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 1),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1.0,
            color: Colors.white54,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/card/bismilah.png',
            color: Colors.white70,
          ),
        ],
      ),
    );
  }
}

// child: GetBuilder<QuranController>(
//     init: quranController,
//     builder: (context) {
//       SuratModelSatuan? surat = quranController.surat.value;
//       return Column(
//         children: [
//           AppBarWidget(
//             onPress: () {
//               Get.back();
//             },
//             leftIcon: Icon(Icons.arrow_back_ios),
//             title: 'aa',
//             rightIcon: [
//               Icon(Icons.bookmark_outline),
//               Icon(Icons.settings_outlined),
//             ],
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: quranController.isLoadingSatuan.value
//                   ? SpinKitWave(
//                       color: kSecondaryColor,
//                     )
//                   : Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Center(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   surat!.name!.short!,
//                                   style: kArabicFontAmiri.copyWith(
//                                       fontSize: 30, fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   surat.name!.transliteration!.id!,
//                                   style: kPrimaryFontStyle.copyWith(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 surat.revelation!.id!,
//                                 style: kSecondaryGreyFontStyle.copyWith(fontSize: 12),
//                               ),
//                               Spacer(),
//                               Text(
//                                 'berjumlah ${surat.numberOfVerses!} ayat',
//                                 style: kSecondaryGreyFontStyle.copyWith(fontSize: 12),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: surat.verses!.map((e) {
//                               return Container(
//                                 width: double.infinity,
//                                 child: Text(
//                                   textAlign: TextAlign.right,
//                                   e.text!.arab!,
//                                   style: kArabicFontAmiri.copyWith(
//                                       fontSize: 40, fontWeight: FontWeight.w500),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         )
//                       ],
//                     ),
//             ),
//           )
//         ],
//       );
//     })),
