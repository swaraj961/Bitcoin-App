import 'package:flutter/material.dart';
import 'package:bitcoinapp/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton<String> getdropdownbuttonAndriod() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(item);
    }
    return DropdownButton<String>(
        value: selectedcurreency, //starting value
        items: dropdownitems,
        onChanged: (value) {
          setState(() {
            selectedcurreency = value;
            print(value);
          });
        });
  }

  CupertinoPicker getcupitinopickerIOS() {
    List<Text> cur = [];
    for (String item in currenciesList) {
      Text textitems = Text(
        item,
        style: TextStyle(color: Colors.white),
      );
      cur.add(textitems);
    }

    return CupertinoPicker(
      backgroundColor: Color(0xFF6B24FF),
      itemExtent: 32,
      onSelectedItemChanged: (selectedvalue) {
        print(selectedvalue);
      },
      children: cur,
    );
  }

  Widget getpicker() {
    if (Platform.isIOS) {
      return getcupitinopickerIOS();
    } else {
      if (Platform.isAndroid) {
        return getdropdownbuttonAndriod();
      }
    }
    return widget;
  }

  String selectedcurreency;

  @override
  Widget build(BuildContext context) {
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
              child: getpicker()),
        ],
      ),
    );
  }
}
