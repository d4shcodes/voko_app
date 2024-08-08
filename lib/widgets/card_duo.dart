
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/screen-pronounce.dart';
import '../screens/screen-video.dart';

Row card_duo(BuildContext context) {
  return Row(
    children: [
      module('SEBUTAN', const Color(0xFFFFD20A), 'assets/pronouce.svg', 'SEBUTAN', context, Pronounce()),
      module('VIDEO', const Color(0xFFA90F3A), 'assets/video.svg', 'VIDEO', context, Video() ),
    ],
  );
}

Expanded module(String title, Color modColor, String pathSvg, String screen, BuildContext context, pageRoute) {
  return Expanded(
    child: GestureDetector(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageRoute),
        );
      } ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0.sp),
        ),
        color: modColor,
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 45.sp,
                color: Color(0xFFF9F9F9),
              ),
            ),
            SizedBox(height: 40.h),
            SvgPicture.asset(
              pathSvg!,
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    ),
  );
}