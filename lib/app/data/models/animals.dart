// To parse this JSON data, do
//
//     final animalsModel = animalsModelFromJson(jsonString);

import 'dart:convert';

AnimalsModel animalsModelFromJson(String str) =>
    AnimalsModel.fromJson(json.decode(str));

String animalsModelToJson(AnimalsModel data) => json.encode(data.toJson());

class AnimalsModel {
  int? id;
  String? namaHewan;
  String? klasifikasi;
  String? tinggi;
  String? panjang;
  String? umur;
  String? makanan;
  String? keterangan;
  List<String>? imageLink;

  AnimalsModel({
    this.id,
    this.namaHewan,
    this.klasifikasi,
    this.tinggi,
    this.panjang,
    this.umur,
    this.makanan,
    this.keterangan,
    this.imageLink,
  });

  factory AnimalsModel.fromJson(Map<String, dynamic> json) => AnimalsModel(
        id: json["id"],
        namaHewan: json["namaHewan"],
        klasifikasi: json["klasifikasi"],
        tinggi: json["tinggi"],
        panjang: json["panjang"],
        umur: json["umur"],
        makanan: json["makanan"],
        keterangan: json["keterangan"],
        imageLink: json["imageLink"] == null
            ? []
            : List<String>.from(json["imageLink"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaHewan": namaHewan,
        "klasifikasi": klasifikasi,
        "tinggi": tinggi,
        "panjang": panjang,
        "umur": umur,
        "makanan": makanan,
        "keterangan": keterangan,
        "imageLink": imageLink == null
            ? []
            : List<dynamic>.from(imageLink!.map((x) => x)),
      };
}
