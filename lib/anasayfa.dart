import 'package:flutter/material.dart';
import 'package:multi_app/hesap_makinesi.dart';
import 'package:multi_app/xox.dart';
import 'package:multi_app/not_hesaplama.dart';
import 'package:multi_app/hakkimizda.dart';
import 'package:multi_app/iletisim.dart';

import 'package:flutter/material.dart';

class Anasayfa extends StatelessWidget {
  final List<String> menuItems = ["Anasayfa", "Hakkımızda", "İletişim"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa"),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case "Anasayfa":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Anasayfa()),
                    );
                    break;
                  case "Hakkımızda":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hakkimizda()),
                    );
                    // Navigator.pushNamed(context, "/hakkimizda");
                    break;
                  case "İletişim":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Iletisim()),
                    );
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return menuItems.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HesapMakinesi()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: Text(
                      "Hesap Makinesi",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blueAccent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotHesaplama()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: Text(
                      "Puan Hesaplama",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.greenAccent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.green,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => XOXHomePage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: Text(
                      "XOX",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.redAccent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
