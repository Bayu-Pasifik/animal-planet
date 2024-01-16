import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/data/models/animals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDescriptionTab(AnimalsModel animal) {
    // Kustomisasi tampilan untuk tab Keterangan
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tambahkan widget untuk menampilkan informasi hewan
            Text(
              "Informasi Hewan",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text("${animal.keterangan}",
                textAlign: TextAlign.justify, style: styleDetail),
            SizedBox(height: 15.h),
            Table(
              children: [
                TableRow(children: [
                  Text(
                    "Kategori",
                    style: styleDetail,
                  ),
                  Text(
                    "${animal.klasifikasi}",
                    style: styleDetail,
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Makanan",
                    style: styleDetail,
                  ),
                  Text(
                    "${animal.makanan}",
                    style: styleDetail,
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Tinggi",
                    style: styleDetail,
                  ),
                  Text(
                    "${animal.tinggi} Cm",
                    style: styleDetail,
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Panjang",
                    style: styleDetail,
                  ),
                  Text(
                    "${animal.panjang} m",
                    style: styleDetail,
                  )
                ]),
                TableRow(children: [
                  Text(
                    "Umur",
                    style: styleDetail,
                  ),
                  Text(
                    "${animal.umur} Tahun",
                    style: styleDetail,
                  )
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }