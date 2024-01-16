import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/data/models/animals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/detail_content_controller.dart';

class DetailContentView extends GetView<DetailContentController> {
  const DetailContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimalsModel animal = Get.arguments['animal'];
    final String image = Get.arguments['images'];

    return Scaffold(
      backgroundColor: lightTheme,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: lightTheme,
                expandedHeight: 250,
                elevation: 0,
                stretch: true,
                pinned: true,
                centerTitle: true,
                title: Text(
                  '${animal.namaHewan}',
                  style: const TextStyle(
                      fontFamily: "nunitoSans",
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(9.r)),
                  tabs: const [
                    Tab(text: "Keterangan"),
                    Tab(text: "Album"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Widget untuk tab Keterangan
              buildDescriptionTab(animal),

              // Widget untuk tab Album
              buildAlbumTab(animal),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget buildAlbumTab(AnimalsModel animal) {
    // Kustomisasi tampilan untuk tab Album
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: animal.imageLink?.length ?? 0,
      itemBuilder: (context, index) {
        // Tambahkan widget untuk menampilkan album hewan
        var gambar = animal.imageLink![index]
            .replaceAll("/view?usp=sharing", "")
            .replaceAll("/view?usp=drive_link", "")
            .replaceAll("/d/", "")
            .replaceAll(
                "https://drive.google.com/", "https://drive.google.com/uc?id=")
            .replaceAll("file", "");
        return CachedNetworkImage(
          imageUrl: gambar,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Image.asset("assets/images/Image_not_available.png"),
        );
      },
    );
  }
}
