import 'package:flutter/material.dart';
import 'dart:math';

class HesapMakinesi extends StatefulWidget {
  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Birinci sayıyı girin',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'İkinci sayıyı girin',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (num1.text != '' && num2.text != '') {
                        result =
                            double.parse(num1.text) + double.parse(num2.text);
                      }
                    });
                  },
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (num1.text != '' && num2.text != '') {
                        result =
                            double.parse(num1.text) - double.parse(num2.text);
                      }
                    });
                  },
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (num1.text != '' && num2.text != '') {
                        result =
                            double.parse(num1.text) * double.parse(num2.text);
                      }
                    });
                  },
                  child: Text('x'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (num1.text != '' && num2.text != '') {
                        result =
                            double.parse(num1.text) / double.parse(num2.text);
                      }
                    });
                  },
                  child: Text('/'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (num1.text != '') {
                        result = sqrt(double.parse(num1.text));
                      }
                    });
                  },
                  child: Text('√'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Sonuç: $result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
