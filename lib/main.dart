import 'package:flutter/material.dart';
import 'package:tech_news_app/pages/home.dart';
import 'package:tech_news_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark ,
        primaryColor: AppColors.primary,
      ),
      home: const Home(),
    );
  }
}

// Changes required to do in the project in addition to tutorial :
// 1. Added internet permission and intent filter inside AndroidManifest.xml file present in android/app/src/main/ .
// 2. The launchUrl is now depreceated in url_launcher package . Hence , done some changes there clearly mentioned in lib/components/bottom_sheet.dart .