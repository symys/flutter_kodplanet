import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/myIcon.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';
import 'myContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporYapilanGun = 0.0;
  int boy = 170;
  int kilo = 70;
  String? ozellik;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Haftada kaç gün spor yapıyorsunuz?',
                    style: kMetinStili,
                  ),
                  Text(sporYapilanGun.round().toString(), style: kSayiStili),
                  Slider(
                    value: sporYapilanGun,
                    min: 0,
                    max: 7,
                    onChanged: (double newDay) {
                      setState(() {
                        sporYapilanGun = newDay;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde kaç sigara içiyorsunuz?',
                    style: kMetinStili,
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    //'${icilenSigara.round()}',
                    style: kSayiStili,
                  ),
                  Slider(
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                    value: icilenSigara,
                    min: 0,
                    max: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.deepOrangeAccent
                        : Colors.white,
                    child: MyIcon(
                        icon: FontAwesomeIcons.female, cinsiyet: 'KADIN'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.deepOrangeAccent
                        : Colors.white,
                    child:
                        MyIcon(icon: FontAwesomeIcons.male, cinsiyet: 'ERKEK'),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 30,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                          UserData( kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              sporYapilanGun: sporYapilanGun,
                              icilenSigara: icilenSigara)
                           )));
              },
              child: Text(
                'HESAPLA',
                style: kMetinStili,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String ozellik) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            ozellik,
            style: kMetinStili,
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            ozellik == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    ozellik == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                ),
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    ozellik == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 15,
                ),
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ],
        )
      ],
    );
  }
}
