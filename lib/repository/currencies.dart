import 'package:dio/dio.dart';

import '../utils/currencies.dart';

class Currencies {
  List<String> getAllCodes() {
    var codes = currencies.keys.toList();
    return codes;
  }
}

class CurrencyConverter {
  static const apiKey = 'zVn1OE35Cr6c4Hfn54kYDsp1YULAJq7J';
  Future<String> cConvert(String from, String to, double amount) async {
    try {
      final url =
          'https://api.apilayer.com/currency_data/convert?to=$to&from=$from&amount=$amount&apikey=$apiKey';
      final res = await Dio().get<Map>(url);

      return res.data!['result'].toString();
    } catch (e) {
      rethrow;
    }
  }
}
