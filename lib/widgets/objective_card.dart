import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container objective_card(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0.sp),
      color: const Color(0xFFF28927),
    ),
    child: Padding(
      padding: EdgeInsets.all(30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OBJEKTIF',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 65.sp,
                    letterSpacing: 8.8.sp,
                    color: Color(0xFFF9F9F9),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'MENYEBUT VOKAL DAN KONSONAN DENGAN SEBUTAN YANG BETUL.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp,
                    letterSpacing: 2.0.sp,
                    color: Color(0xFFF9F9F9),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/object-icon.svg',
                  height: MediaQuery.of(context).size.height * 0.14, // Adjust the multiplier as needed
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}