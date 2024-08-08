// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voko_app/widgets/vocal.dart';
import 'dart:math';

class Pronounce extends StatelessWidget {
  final List color_choices = [
    Color(0XFF9C0D38),
    Color(0XFF3C335C),
    Color(0xFF24346A),
    Color(0XFF2A6041),
    Color(0XFFDF7C2A)
  ];
  final List title = [
    'BAKUL',
    'CUCI',
    'DUDUK',
    'FIKIR',
    'GEMBIRA',
    'HARI',
    'JAM',
    'KOLAM',
    'LORI',
    'MAKAN',
    'NASI',
    'PAPAN',
    'QURAN',
    'RUSA',
    'SEDIH',
    'TUPAI',
    'VAN',
    'WAU',
    'X-RAY',
    'YO-YO',
    'ZIRAFAH'
  ];

  Pronounce({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0XFFF9F9F9),
          centerTitle: true,
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0XFFF9F9F9),
            tabs: [
              Tab(
                child: Text(
                  'VOKAL',
                  style: TextStyle(
                    color: Color(0XFFF9F9F9),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'KONSONAN',
                  style: TextStyle(
                    color: Color(0XFFF9F9F9),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFFFFD20A),
          title: Text('SEBUTAN'),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: ListView(
                padding: EdgeInsets.all(5.sp),
                children: [
                  vocal_card(
                      'assets/a.png',
                      'assets/gif/aayah.gif',
                      'assets/gif/ayam.gif',
                      'AYAH',
                      'AYAM',
                      context,
                      'audio/ayah.ogg',
                      'audio/ayam.ogg'),
                  vocal_card(
                      'assets/e.png',
                      'assets/gif/emak.gif',
                      'assets/gif/emas.gif',
                      'EMAK',
                      'EMAS',
                      context,
                      'audio/emak.ogg',
                      'audio/emas.ogg'),
                  vocal_card(
                      'assets/e.png',
                      'assets/gif/enak.gif',
                      'assets/gif/epal.gif',
                      'ENAK',
                      'EPAL',
                      context,
                      'audio/enak.ogg',
                      'audio/epal.ogg'),
                  vocal_card(
                      'assets/i.png',
                      'assets/gif/ikan.gif',
                      'assets/gif/itik.gif',
                      'IKAN',
                      'ITIK',
                      context,
                      'audio/ikan.ogg',
                      'audio/itik.ogg'),
                  vocal_card(
                      'assets/o.png',
                      'assets/gif/ombak.gif',
                      'assets/gif/oorang.gif',
                      'OMBAK',
                      'ORANG',
                      context,
                      'audio/ombak.ogg',
                      'audio/orang.ogg'),
                  vocal_card(
                      'assets/u.png',
                      'assets/gif/ulat.gif',
                      'assets/gif/unta.gif',
                      'ULAT',
                      'UNTA',
                      context,
                      'audio/ulat.ogg',
                      'audio/unta.ogg'),
                ],
              ),
            ),
            Tab(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(21, (index) {
                  Color specificColor = color_choices[index % color_choices.length];
                  String titleCard = title[index];
                  return consonant('assets/consonant/gif_${index + 1}.gif','consonant/con_${index + 1}.ogg',
                      specificColor,titleCard,context);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card consonant(String imgPath, String sound_card ,Color cardColor, titleCard ,context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                player.play(AssetSource(sound_card));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0.sp),
                child: Image.asset(
                  imgPath,
                  height: 400.0.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover, // You can adjust the BoxFit as needed
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              titleCard,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 34.sp,
                color: Color(0XFFF9F9F9)
              ),
            ),
          ],
        ),
      ),
    );
  }


}
