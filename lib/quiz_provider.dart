import 'package:flutter/material.dart';

class SorularProvider extends ChangeNotifier {
  List<Soru> _sorularListesi = [
    Soru("Soru 1: Mekke'den Medine'ye Hicret hangi yılda gerçekleşmiştir?",
        ['A: 618', 'B: 619', 'C: 620', 'D: 622'], 'C'), //cevap C
    Soru("Soru 2: Kur'an-ı Kerim kaç ayetten oluşmaktadır?",
        ['A: 1188', 'B: 114', 'C: 666', 'D: 6666'], 'C'), // Cevap C
    Soru("Soru 3:  Cumhurbaşkanı kaç yılda bir seçilir?",
        ['A: 3', 'B: 5', 'C: 2', 'D: 1'], 'C'), // Cevap B
    Soru("Soru 4:  Ülkemizde 2017 yılında asgari ücret ne kadardı?",
        ['A: 3500', 'B: 500', 'C: 1400', 'D: 1000'], 'C'), // Cevap C
    Soru("Soru 5: Albert Einstein hangi alanda Nobel ödülü almıştır?",
        ['A: Fizik', 'B: Kimya', 'C: Edebiyat', 'D:Matematik'], 'C'), // Cevap A
    Soru(
        "Soru 6: Kırmızı ve sarı renklerinin karışımından hangi renk elde edilir?",
        ['A: Mor', 'B: Pembe', 'C: Turuncu', 'D: Yeşil'],
        'C'), // Cevap C
    Soru("Soru 7: Yüz ölçümü bakımından en büyük ülke hangisidir?",
        ['A: Rusya', 'B: Çin', 'C: Hindistan', 'D: Amerika'], 'C'), // Cevap A
    Soru("Soru 8: Periyodik tabloda kaç element listelenmiştir?",
        ['A: 90', 'B: 55', 'C: 118', 'D: 100'], 'C'), // Cevap C
    Soru(
        "Soru 9: Ayın üzerinde dursaydınız ve güneş üzerinize parlasaydı gökyüzü ne renk olurdu??",
        ['A: Beyaz', 'B: Mor', 'C: Yeşil', 'D: Siyah'],
        'C'), // Cevap D
    Soru(
        "Soru 10: Tipik bir cam şişenin doğada çözünmesi ortalama kaç yıl alır??",
        ['A: 900', 'B: 5500', 'C: 4000', 'D: 1000'],
        'C'), // Cevap C
    Soru("Soru 11: Köpekbalıklarının kaç kemiği vardır?",
        ['A: 0', 'B: 5', 'C: 7', 'D: 3'], 'C'), // Cevap A
    Soru("Soru 12: Güneş sistemimizde kaç gezegen var??",
        ['A: 10', 'B: 9', 'C: 8', 'D: 7'], 'C'), // Cevap C
    Soru("Soru 13: Bir solucanın kaç kalbi vardır??",
        ['A: 5', 'B: 2', 'C: 1', 'D: 0'], 'C'), // Cevap A
    Soru("Soru 14: Dünyanın en yüksek binası hangi ülkededir??",
        ['A: Türkiye', 'B: ABD', 'C: Rusya', 'D: Dubai'], 'C'), // Cevap D
    Soru("Soru 15: İnsan iskeletinde kaç kemik vardır??",
        ['A: 206', 'B: 500', 'C: 400', 'D: 100'], 'C'), // Cevap A
    //Sorular arttirilabilir
  ];

  int _soruIndex = 0;
  int _skor = 0;

  List<Soru> get sorular => _sorularListesi;
  int get currentQuestionIndex => _soruIndex;
  int get score => _skor;

  List<int> get correctAnswerIndices {
    return List.generate(_sorularListesi.length, (index) {
      if (_sorularListesi[index].dogruCevap == 'C') {
        return index;
      }
      return -1;
    }).where((index) => index != -1).toList();
  }

  void answerQuestion(String answer) {
    if (_sorularListesi[_soruIndex].dogruCevap == answer) {
      _skor++;
    }
    _soruIndex++;
    notifyListeners();
  }

  void reset() {
    _soruIndex = 0;
    _skor = 0;
    notifyListeners();
  }
}

class Soru {
  final String soruMetni;
  final List<String> secenekler;
  final String dogruCevap;

  Soru(this.soruMetni, this.secenekler, this.dogruCevap);
}
