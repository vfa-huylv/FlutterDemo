import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  final String mtext;

  OtherPage(this.mtext);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mtext),
      ),
      body: Center(
        child: Text(mtext),
      ),
    );
  }
}
