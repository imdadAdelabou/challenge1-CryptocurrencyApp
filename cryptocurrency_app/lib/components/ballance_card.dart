import 'package:cryptocurrency_app/components/min_button.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BallanceCard extends StatefulWidget {
  final List<Color> colorsGradient;
  final IconData iconDevice;
  final String totalBalance;

  const BallanceCard({
    required this.colorsGradient,
    required this.iconDevice,
    required this.totalBalance,
  });

  @override
  _BallanceCardState createState() => _BallanceCardState();
}

class _BallanceCardState extends State<BallanceCard> {
  String contentText = "";
  String deposit = "";
  String withDraw = "";

  @override
  void initState() {
    super.initState();
    contentText = "Your balance is equivalent";
    deposit = "Deposit";
    withDraw = "Withdraw";
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8.0,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 350,
        height: 172,
        padding: EdgeInsets.only(top: 25.0, left: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: widget.colorsGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  widget.iconDevice,
                  color: Colors.white,
                ),
                Text(
                  widget.totalBalance,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: maxWidth * 0.07,
                  ),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.wallet,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(width: 20.0)
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              contentText,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 15,
              ),
            ),
            Spacer(),
            Row(
              children: [
                MinButton(content: deposit, action: () {}),
                MinButton(content: withDraw, action: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
