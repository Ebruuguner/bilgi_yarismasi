import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class SoruEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final soruProvider = Provider.of<SorularProvider>(context);

    if (soruProvider.currentQuestionIndex >= soruProvider.sorular.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/sonuc');
      });
      return Scaffold(
        body: Center(
          child: Text('Quiz bitti'),
        ),
      );
    }

    final soru = soruProvider.sorular[soruProvider.currentQuestionIndex];

    return Scaffold(
      backgroundColor: Color(0xFFE7E8D8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                soru.soruMetni,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            ...soru.secenekler.map((secenek) => Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7FA1C3), // Buton rengi
                      foregroundColor:
                          Color(0xFFF5EDED), // Buton içindeki yazı rengi
                    ),
                    onPressed: () {
                      soruProvider.answerQuestion(secenek);
                      if (soruProvider.currentQuestionIndex >=
                          soruProvider.sorular.length) {
                        Navigator.pushReplacementNamed(context, '/sonuc');
                      }
                    },
                    child: Text(secenek, textAlign: TextAlign.center),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
