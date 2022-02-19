import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const HavadanSudan());
}

class HavadanSudan extends StatelessWidget {
  const HavadanSudan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text('BİRAZ HAVADAN SUDAN KONUŞALIM !'),
        ),
        body: HavalarNasilOrda(),
      ),
    );
  }
}

class HavalarNasilOrda extends StatefulWidget {
  const HavalarNasilOrda({Key? key}) : super(key: key);

  @override
  _HavalarNasilOrdaState createState() => _HavalarNasilOrdaState();
}

class _HavalarNasilOrdaState extends State<HavalarNasilOrda> {
  int yanitIndex = 0;

  List<String> herseyHakkinda = [
    'Görüldüğü gibi bu oturma düzeni modern ama geleneksel japon çizgilerine hakim bir tasarıma sahip. Önümüzdeki yıllarda kültürün çizgilerinin kaybolmadığı bu tasarımın evlerde daha sık tercih edilmesi bekleniyor.',
    'Doğadan ilham alarak çalışmalarınızı yürütebileceğiniz bir tasarımla kullanıcıya huzur sağlamak hedeflenmiş. Isı yalıtımının da önemsendiği detaylar dikkat çekmekte.',
    'Yüksek tavan yapısı kullanılarak içeriye ferahlık hissi verilirken duvarların yerine cam dokunun kullanılması evi kış bahçesine çevirmiş diyebiliriz.',
        'Bir kaç zarif işlenmiş kapıdan geçerek su elemanına ulaşma şeklinde düşünülen bu mekan daha çok Akdeniz mimarisini andırıyor.',
    'İlk bakışta normal bir yeşil alan olarak düşünülebilecek bir yer fakat onu önemli ve değerli kılan doğal mekan hissinin doğal elemanlarla çevrelenerek verilmiş olması..',
    'Pakistan-ın Baltistan bölgesini andıran bu doğa harikası yere gitmeyi ve orada nefeslenmeyi dilemekten başka pek söylenecek bir şey bulamıyorum..',
        'Sizi alıp serin ve hafif meltemli günlere götürecek bu fotoğraf sadece fotoğraf olmaktan çıksın istiyorsanız lütfen iletişime geçin',
    'Biraz Balkanlar biraz uzak doğu hissi veren bu nadide doğa parçasını yerinde ziyaret etmek isterseniz turlarımız Mart ayında başlayacak efendim :)',
    'Yazlık sayfiye alanlar yerine soğuk sevip buzullara yakından bakmak isteyenleri de kutuplar turlarımıza bekliyoruz :)'
  ];

  void resimdetayi() {
    setState(() {
      yanitIndex = Random().nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage('assets/sea_1.jpg'),
          ),
          SizedBox(height: 15,),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink,
            child: ListTile(
              onTap: () {setState(() {
                yanitIndex = Random().nextInt(3);
              });
              },
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                'Yaşama dair',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink,
            child: ListTile(
              onTap: () {setState(() {
                yanitIndex = Random().nextInt(3)+3;
              });
              },
              leading: Icon(
                Icons.audiotrack,
                color: Colors.white,
              ),
              title: Text(
                'Mekan ve yaşam',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.pink,
            child: ListTile(
              onTap: () {setState(() {
                yanitIndex = Random().nextInt(3)+6;
              });
              },
              leading: Icon(
                Icons.beach_access,
                color: Colors.white,
              ),
              title: Text(
                'Su ve yaşam',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              herseyHakkinda[yanitIndex],
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
    );
  }
}
