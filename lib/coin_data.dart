import 'dart:convert';

import 'package:http/http.dart' as http;

const apiurl1 = 'https://rest.coinapi.io/v1/exchangerate/BTC';
const apiurl2 = 'https://rest.coinapi.io/v1/exchangerate/ETH';
const apiurl3 = 'https://rest.coinapi.io/v1/exchangerate/LTC';
const apikey = '3762E6EA-B1C4-4039-AF9B-365AE365D372';

//3762E6EA-B1C4-4039-AF9B-365AE365D372 backup key
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getdataBTC(String selectedcurrency) async {
    String requrl1 = '$apiurl1/$selectedcurrency?apikey=$apikey';
    http.Response response = await http.get(requrl1);
    if (response.statusCode == 200) {
      var fetchdata = jsonDecode(response.body);
      var rate = fetchdata['rate'];
      print(rate);

      return rate;
    } else {
      print(response.statusCode);
      throw 'cant fetch data';
    }
  }

  Future getdataETH(String selectedcurrency) async {
    String requrl2 = '$apiurl2/$selectedcurrency?apikey=$apikey';
    http.Response response = await http.get(requrl2);
    if (response.statusCode == 200) {
      var fetchdata = jsonDecode(response.body);
      var rate = fetchdata['rate'];
      print(rate);

      return rate;
    } else {
      print(response.statusCode);
      throw 'cant fetch data';
    }
  }

  Future getdataLTC(String selectedcurrency) async {
    String requrl3 = '$apiurl2/$selectedcurrency?apikey=$apikey';
    http.Response response = await http.get(requrl3);
    if (response.statusCode == 200) {
      var fetchdata = jsonDecode(response.body);
      var rate = fetchdata['rate'];
      print(rate);

      return rate;
    } else {
      print(response.statusCode);
      throw 'cant fetch data';
    }
  }
}
