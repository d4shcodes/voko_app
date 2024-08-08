import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/screen-homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // debugDisableWidgetInspector = true;
        home: const Homepage(),
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: const Color(0xFFFFF7EA),
        ),
      ),
      designSize: const Size(1080, 2400),
    );
  }
}
