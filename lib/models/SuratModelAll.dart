// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class SuratModelAll {
  SuratModelAll({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  factory SuratModelAll.fromJson(Map<String, dynamic> json) => SuratModelAll(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );
}

class NameSurat {
  NameSurat({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  TranslationSurat? transliteration;
  TranslationSurat? translation;

  factory NameSurat.fromJson(Map<String, dynamic> json) => NameSurat(
        short: json["short"],
        long: json["long"],
        transliteration: TranslationSurat.fromJson(json["transliteration"]),
        translation: TranslationSurat.fromJson(json["translation"]),
      );
}

class TranslationSurat {
  TranslationSurat({
    this.en,
    this.id,
  });

  String? en;
  String? id;

  factory TranslationSurat.fromJson(Map<String, dynamic> json) => TranslationSurat(
        en: json["en"],
        id: json["id"],
      );
}

class RevelationSurat {
  RevelationSurat({
    this.arab,
    this.en,
    this.id,
  });

  String? arab;
  String? en;
  String? id;

  factory RevelationSurat.fromJson(Map<String, dynamic> json) => RevelationSurat(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );
}

class TafsirSurat {
  TafsirSurat({
    this.id,
  });

  String? id;

  factory TafsirSurat.fromJson(Map<String, dynamic> json) => TafsirSurat(
        id: json["id"],
      );
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
