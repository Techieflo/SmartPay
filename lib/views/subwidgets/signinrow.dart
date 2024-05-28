import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogosRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 155,
            height: 56,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#E5E7EB")),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
              width: 70,
              height: 70,
            ),
          ),
          Container(
            width: 155,
            height: 56,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#E5E7EB")),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              'https://w7.pngwing.com/pngs/27/566/png-transparent-logo-spole%C4%8Dnosti-apple-logo-spole%C4%8Dnosti-apple-apple-heart-computer-logo-thumbnail.png',
              width: 70,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}
