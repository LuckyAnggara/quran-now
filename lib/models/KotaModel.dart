// To parse this JSON data, do
//
//     final daftarKota = daftarKotaFromJson(jsonString);

class KotaModel {
  KotaModel({
    this.id,
    this.lokasi,
  });

  String? id;
  String? lokasi;

  factory KotaModel.fromJson(Map<String, dynamic> json) => KotaModel(
        id: json["id"] == null ? null : json["id"],
        lokasi: json["lokasi"] == null ? null : json["lokasi"],
      );
}
