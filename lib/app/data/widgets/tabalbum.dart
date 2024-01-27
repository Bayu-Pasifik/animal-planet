import 'package:animal_planet/app/data/models/animals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildAlbumTab(AnimalsModel animal) {
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
      var gambar = animal.imageLink![index]
          .replaceAll("/view?usp=sharing", "")
          .replaceAll("/view?usp=drive_link", "")
          .replaceAll("/d/", "")
          .replaceAll(
              "https://drive.google.com/", "https://drive.google.com/uc?id=")
          .replaceAll("file", "");
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              allowSnapshotting: true,
              builder: (context) => ExtendedImageSlidePage(
                slideAxis: SlideAxis.both,
                slideType: SlideType.wholePage,
                
                onSlidingPage: (state) {},
                child: CachedNetworkImage(
                  imageUrl: gambar,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/Image_not_available.png"),
                ),
              ),
            ),
          );
        },
        child: CachedNetworkImage(
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
        ),
      );
    },
  );
}
