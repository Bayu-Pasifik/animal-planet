import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [greenColor, greenGradient],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter)),
        ),
        SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 60.h),
            SizedBox(
                height: 400.h,
                width: 400.w,
                // color: Colors.amber,
                child: Image.asset(
                  "assets/images/simba_lion.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Temukan Hewan anda",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "nunitoSans",
                    fontSize: 20.sp,
                    color: tabColor),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  "Menjadi lebih dekat dengan hewan\ndengan aplikasi kami",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "nunitoSans",
                      fontSize: 14.sp,
                      color: Colors.white)),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.r),
                  child: SizedBox(
                      width: 180.w,
                      height: 35.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.HOME);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(tabColor)),
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                              fontFamily: "nunitoSans",
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ),
            )
          ],
        ))
      ]),
    );
  }
}
