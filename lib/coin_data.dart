import 'dart:convert';

import 'package:http/http.dart' as http;

const url = 'https://api.coindesk.com/v1/bpi/currentprice/BTC/USD.json';

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
 Future getdata() async {
 http.Response response =  await http.get(url);
 if(response.statusCode == 200){
var fetchdata = jsonDecode(response.body);
// String currency = jsonDecode(fetchdata)['bpi']['USD']['code'];
// print(currency);
 var rate = fetchdata['bpi']['USD']['rate'];
print(rate);

return rate;
 }
else {
  print(response.statusCode);
  
}

 }



}