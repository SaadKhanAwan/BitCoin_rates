import 'package:bit_coin_tracker/dropdownitem.dart';
import 'package:bit_coin_tracker/sevices/helper.dart';
import 'package:bit_coin_tracker/widgets/crypto_card.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropDownMenuitem menuitem = DropDownMenuitem();

  String currentCurrency = "PKR";
  // here are the getdata (data )will be stored
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(
              // is waiting is for when app runs it is by default false it make
              // it  true and once getdata is called is again false and agian app rusns and soo on
              value:
                  isWaiting ? "?" : coinValues['BTC'] ?? "Data not available",
              selectedCurrency: currentCurrency,
              cryptoCurrency: "BTC"),
          CryptoCard(
              value:
                  isWaiting ? "?" : coinValues['ETH'] ?? "Data not available",
              selectedCurrency: currentCurrency,
              cryptoCurrency: "ETH"),
          CryptoCard(
              value:
                  isWaiting ? "?" : coinValues['LTC'] ?? "Data not available",
              selectedCurrency: currentCurrency,
              cryptoCurrency: "LTC"),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: DropdownButton(
                items: menuitem.menubutonitem(),
                value: currentCurrency,
                onChanged: (value) {
                  setState(() {
                    currentCurrency = value;
                    // this get data is call here because to change state
                    getData();
                  });
                },
              )),
        ],
      ),
    );
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await Helper().getCoinData(currentCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      rethrow;
    }
  }
}
