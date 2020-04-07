import 'dart:convert';

import 'package:http/http.dart' as http;

const apiurl = 'https://rest.coinapi.io/v1/exchangerate/BTC'; 
const apikey='76B5E42E-38B7-441A-923E-EA37C8608037'; 

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
 Future getdata(String selectedcurrency ) async {
   String requrl = '$apiurl/$selectedcurrency?apikey=$apikey';
 http.Response response =  await http.get(requrl);
 if(response.statusCode == 200){
var fetchdata = jsonDecode(response.body);
var rate = fetchdata['rate'];
print(rate);

return rate;
 }
else {
  print(response.statusCode);
  
}

 }



}