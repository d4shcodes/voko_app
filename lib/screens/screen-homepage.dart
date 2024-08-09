// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voko_app/widgets/objective_card.dart';
import 'package:voko_app/widgets/card_duo.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screen-game.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: currentWidth < 480
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80.h),
                        objective_card(context),
                        SizedBox(height: 40.h),
                        Text(
                          'KANDUNGAN',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40.sp,
                            color: Color(0xFFF1F1F1F),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        card_duo(context),
                        SizedBox(height: 40.h),
                        card_single(context),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      'assets/footer.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )
            : Center(
                child: SvgPicture.asset('assets/not-found.svg'),
              ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row card_single(context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game()),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0.sp),
              ),
              color: Color(0XFF13427C),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 35.0.sp,
                      left: 55.0.sp,
                      child: Text(
                        'PERMAINAN',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 46.sp,
                          color: Color(0xFFF9F9F9),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35.0.sp,
                      left: 220.0.sp,
                      child: SvgPicture.asset(
                        'assets/games.svg',
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    // Add more Positioned widgets or other children as needed
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
