import 'package:animal_planet/app/data/models/animals.dart';
import 'package:animal_planet/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabbarContent extends StatelessWidget {
  const TabbarContent(
      {super.key, required this.futureFunction});

  final Future futureFunction;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          padding: EdgeInsets.all(8.r),
          itemCount: snapshot.data?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1.6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            AnimalsModel animal = snapshot.data![index];
            var images = animal.imageLink![index]
                .replaceAll("/view?usp=sharing", "")
                .replaceAll("/view?usp=drive_link", "")
                .replaceAll("/d/", "")
                .replaceAll("https://drive.google.com/",
                    "https://drive.google.com/uc?id=")
                .replaceAll("file", "");
            // debugPrint(images);
            return GestureDetector(
              onTap: () =>
                  Get.toNamed(Routes.DETAIL_CONTENT, arguments: {
                    "animal":animal,
                    "images": images
                    }),
              child: SizedBox(
                width: 220.w,
                height: 220.h,
                // color: Colors.red,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 220.w,
                      height: 220.h,
                      child: CachedNetworkImage(
                        imageUrl: images,
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
                        errorWidget: (context, url, error) => Image.asset(
                            "assets/images/Image_not_available.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 220.w,
                          height: 20.h,
                          color: Colors.grey.withOpacity(0.5),
                          child: Text(
                            "${animal.namaHewan}",
                            style: TextStyle(
                                fontFamily: "nunitoSans",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
