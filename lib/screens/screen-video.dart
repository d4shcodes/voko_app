// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/landscape-player.dart';
import '../model/video.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  int _currentIndex = 0;

  void _playVid({int index = 0, bool init = false}) {
    if (index < 0 || index >= videos.length) return;

    if (!init) {
      _controller.pause();
    }

    setState(() => _currentIndex = index);

    _controller = VideoPlayerController.asset(videos[_currentIndex].src)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) {
        if (init) {
          _controller.play();
        }
      });
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playVid(init: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0XFFF9F9F9),
        backgroundColor: const Color(0xFFA90F3A),
        title: const Text('Video'),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFA90F3A),
            height: 640.h,
            child: _controller.value.isInitialized
                ? Column(
                    children: [
                      Stack(
                        children:[
                          SizedBox(
                            height: 380.h,
                            child: VideoPlayer(_controller),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LandscapePlayerPage(controller: _controller),
                                ),
                              ).then((_) {
                                // Set preferred orientations to portrait mode when returning from landscape page
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                              });
                            },
                              icon: Icon(
                              Icons.fullscreen,
                                color: Color(0XFFF9F9F9),
                                size: 60.sp,
                             ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: _controller,
                            builder: (context, VideoPlayerValue value, child) {
                              return Text(
                                _videoDuration(value.position),
                                style: TextStyle(
                                  color: Color(0XFFF9F9F9),
                                  fontSize: 35.sp,
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.sp, horizontal: 12.sp),
                              ),
                            ),
                          ),
                          Text(
                            _videoDuration(_controller.value.duration),
                            style: TextStyle(
                              color: Color(0XFFF9F9F9),
                              fontSize: 35.sp,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () => _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play(),
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Color(0XFFF9F9F9),
                          size: 70.sp,
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Color(0XFFF9F9F9)),
                  ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0XFFF9F9F9),
                  child: InkWell(
                    onTap: () => _playVid(index: index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.sp),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 250.h,
                            width: 350.w,
                            child: Image.asset(
                              videos[index].thumbnail,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 50.w),
                          Text(
                            videos[index].name,
                            style: TextStyle(fontSize: 50.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
