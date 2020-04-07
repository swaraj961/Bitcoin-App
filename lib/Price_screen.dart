import 'package:flutter/material.dart';
import 'package:bitcoinapp/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData c1 = CoinData();
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
            getcoindata();
            //  print(value);
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
  var bitcoinvalueBTC = '';
  var bitcoinvalueETH = '';
  var bitcoinvalueLTC = '';

  void getcoindata() async {
    try {
      var data1 = await c1.getdataBTC(selectedcurreency);
      var data2 = await c1.getdataETH(selectedcurreency);
      var data3 = await c1.getdataLTC(selectedcurreency);
      setState(() {
        bitcoinvalueBTC = data1.toString();
        bitcoinvalueETH = data2.toString();
        bitcoinvalueLTC = data3.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getcoindata();
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              //card1
              color: Color(0xFFFFA000),
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinvalueBTC $selectedcurreency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              //card2

              color: Color(0xFFFFA000),
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $bitcoinvalueETH $selectedcurreency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              //card3
              color: Color(0xFFFFA000),
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $bitcoinvalueLTC $selectedcurreency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
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
