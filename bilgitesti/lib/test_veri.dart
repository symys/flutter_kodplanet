import 'package:bilgitesti/soru.dart';

class TestVeri{
  int _soruIndexi = 0;

  List <Soru> _soruBankasi = [
    Soru(soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti:false ),
    Soru(soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır', soruYaniti:true ),
    Soru(soruMetni: 'Dünya düzdür',soruYaniti:false ),
    Soru(soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır', soruYaniti:false ),
    Soru(soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir', soruYaniti:true ),
    Soru(soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', soruYaniti:true ),
  ];

  String getSoruMetni(){
    return _soruBankasi[_soruIndexi].soruMetni;
  }

  bool getSoruYaniti(){
    return _soruBankasi[_soruIndexi].soruYaniti;
  }

  void sonrakiSoru(){
    if(_soruIndexi+1 < _soruBankasi.length)
      _soruIndexi++;
  }

  bool testBittiMi() {
    if(_soruIndexi+1 >= _soruBankasi.length)
    {return true;}
    else {return false;}
  }

  void testiSifirla(){
    _soruIndexi = 0;
  }
}