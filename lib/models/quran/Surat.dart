class Surat {
  Surat({
    required this.status,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    required this.ayat,
  });
  late final bool status;
  late final int nomor;
  late final String nama;
  late final String namaLatin;
  late final int jumlahAyat;
  late final String tempatTurun;
  late final String arti;
  late final String deskripsi;
  late final String audio;
  late final List<Ayat> ayat;

  Surat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nomor = json['nomor'];
    nama = json['nama'];
    namaLatin = json['nama_latin'];
    jumlahAyat = json['jumlah_ayat'];
    tempatTurun = json['tempat_turun'];
    arti = json['arti'];
    deskripsi = json['deskripsi'];
    audio = json['audio'];
    ayat = List.from(json['ayat']).map((e) => Ayat.fromJson(e)).toList();
  }
}

class Ayat {
  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });
  late final int id;
  late final int surah;
  late final int nomor;
  late final String ar;
  late final String tr;
  late final String idn;

  Ayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'];
    nomor = json['nomor'];
    ar = json['ar'];
    tr = json['tr'];
    idn = json['idn'];
  }
}
