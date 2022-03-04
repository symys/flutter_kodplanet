
import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData _userData;
  Calculate(this._userData);

  double hesaplama() {
    double result;

    result = 90 + _userData.sporYapilanGun - _userData.icilenSigara;
    result = result + (_userData.boy / _userData.kilo);

    if(_userData.seciliCinsiyet == 'KADIN')
      return result+3;
    else
      return result;
  }
}