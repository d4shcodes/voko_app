import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

GFCard vocal_card(String path_vocal, String img_1, String img_2, String name_1, String name_2, BuildContext context, String sound_itm1, String sound_itm2) {
  return GFCard(
    image: Image.asset(
      path_vocal,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    ),
    borderRadius: BorderRadius.circular(20.0.sp),
    showImage: true,
    content: Column(children: [
      Divider(
        height: 50.h,
        thickness: 1,
        color: Color(0xFFD9D9D9), // Customize the color of the line
      ),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.sp, 0.sp, 0.sp, 5.sp),
                child: Column(
                  children: [
                    Text(
                      name_1,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 44.sp),
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        player.play(AssetSource(sound_itm1));
                      },
                      child: ClipRRect(
                        // borderRadius: BorderRadius.all(Radius.elliptical(120.sp, 60.sp)),
                        child: Image.asset(
                          img_1,
                          // height: 300.0.h,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
            child:
                const VerticalDivider(thickness: 1, color: Color(0xFFD9D9D9)),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.sp, 0.sp, 0.sp, 5.sp),
                child: Column(
                  children: [
                    Text(
                      name_2,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 44.sp),
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        player.play(AssetSource(sound_itm2));
                      },
                      child: ClipRRect(
                        // borderRadius: BorderRadius.all(Radius.elliptical(120.sp, 60.sp)),
                        child: Image.asset(
                          img_2,
                          // height: 300.0.h,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ]),
  );
}

// return Card(
//     child: Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(0.sp, 50.sp, 0.sp, 0.sp),
//                   child: SvgPicture.asset(path_vokal, height: 200.0.h),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Divider(
//           height: 100.h,
//           thickness: 1,
//           color: Color(0xFFD9D9D9), // Customize the color of the line
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(0.sp,0.sp,0.sp,35.sp),
//                   child: Column(
//                     children: [
//                       Text(
//                         name_1,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0.sp),
//                         child: Image.asset(
//                           img_1,
//                           height: 300.0.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 150.h,
//               child: const VerticalDivider(
//                   thickness: 1, color: Color(0xFFD9D9D9)),
//             ),
//             Expanded(
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(0.sp,0.sp,0.sp,35.sp),
//                   child: Column(
//                     children: [
//                       Text(
//                         name_2,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0.sp),
//                         child: Image.asset(
//                           img_2,
//                           height: 300.0.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
