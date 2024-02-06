import 'package:bit_coin_tracker/constants/coin_data.dart';
import 'package:bit_coin_tracker/sevices/api_networking.dart';

// this key is of software email
String apikey = "1229D867-ABCC-4EAF-9503-A8760E8C053E";

class Helper {
  Future getCoinData(String currentlocation) async {
    // here is map is because we are running loop in api for 3 differnt coins which is saving in map cryptoPtices
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      ApiNetworking networking = ApiNetworking(
          uRL:
              "https://rest.coinapi.io/v1/exchangerate/$crypto/$currentlocation?apikey=$apikey");
      double data = await networking.getapi();
      cryptoPrices[crypto] = data.toStringAsFixed(0);
    }

    return cryptoPrices;
  }
}
// }
