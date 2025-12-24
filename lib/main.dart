import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/view/myApp/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ConstantValue.env);
  runApp(const MyApp());
}
