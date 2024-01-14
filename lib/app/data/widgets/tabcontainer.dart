import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabContainer extends StatelessWidget {
  const TabContainer({super.key, required this.asset, required this.name});
  final String asset;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: name != "Serangga" ? 60.w : 65.w,
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            width: 40.w,
            child: Image.asset(
              asset,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "nunitoSans",
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}