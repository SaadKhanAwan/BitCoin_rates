import 'package:bit_coin_tracker/constants/coin_data.dart';
import 'package:flutter/material.dart';

class DropDownMenuitem {
  // it is also done by for loop (make a onther list and put value of currentlist in new list and same)
  List<DropdownMenuItem> menubutonitem() {
    var items = currenciesList.map((String currency) {
      return DropdownMenuItem(
        value: currency,
        child: Text(
          currency,
        ),
      );
    }).toList();
    return items;
  }
}
