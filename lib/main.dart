import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';
import 'home_page.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SorularProvider(),
      child: MaterialApp(
        title: 'Bilgi Yarışması',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        debugShowCheckedModeBanner:
            false, // Debug banner'ını kaldırmak için eklendi
        routes: {
          '/': (context) => AnaEkran(),
          '/quiz': (context) => SoruEkran(),
          '/sonuc': (context) => SonucEkran(),
        },
      ),
    );
  }
}
