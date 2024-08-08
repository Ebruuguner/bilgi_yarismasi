import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class SonucEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<SorularProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFE7E8D8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Puanınız: 60'),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7FA1C3), // Buton rengi
                foregroundColor: Color(0xFFF5EDED), // Buton içindeki yazı rengi
              ),
              onPressed: () {
                quizProvider.reset();
                Navigator.pushReplacementNamed(context, '/quiz');
              },
              child: Text('Yeniden Quiz Başlat'),
            ),
          ],
        ),
      ),
    );
  }
}
