import 'package:flutter/material.dart';
import 'package:bitcoinapp/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurreency;
  List getcurrency() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[
          i]; //assigning the string with the index of the array from the list
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(item);
    }
    return dropdownitems;
  }

  @override
  Widget build(BuildContext context) {
    getcurrency();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 BitCoin-App',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFFFFA000),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF6B24FF),
            child: DropdownButton<String>(
                value: selectedcurreency, //starting value
                items: getcurrency(),
                onChanged: (value) {
                  setState(() {
                    selectedcurreency = value;
                    print(value);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
