import 'package:flutter/material.dart';

class AnaEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Image.asset(
                'assets/resim.jpg', // İleri eğik çizgi kullanın
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Text('Quizi Başlat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
