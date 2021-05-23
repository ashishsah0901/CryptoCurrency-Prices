import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Currency"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _crytowidget(),
    );
  }

  Widget _crytowidget() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (context, index) {
                final Map currency = widget.currencies[index];
                return getListItemUI(currency);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile getListItemUI(Map currency) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: getSubtitleText(
          currency['price'], currency['1d']['price_change_pct']),
      isThreeLine: true,
    );
  }

  Widget getSubtitleText(String price, String percent) {
    TextSpan priceTextWidget =
        TextSpan(text: "\u20B9$price\n", style: TextStyle(color: Colors.black));
    String percentChangeText = "1 hour: $percent%";
    TextSpan percentWidget;
    if (double.parse(percent) > 0) {
      percentWidget = TextSpan(
          text: percentChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentWidget = TextSpan(
          text: percentChangeText, style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(children: [
        priceTextWidget,
        percentWidget,
      ]),
    );
  }
}
