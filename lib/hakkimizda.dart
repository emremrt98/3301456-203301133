import 'package:flutter/material.dart';
import 'package:multi_app/hakkimizda.dart';
import 'package:multi_app/iletisim.dart';
import 'package:multi_app/anasayfa.dart';

class Hakkimizda extends StatelessWidget {
  final List<String> menuItems = ["Anasayfa", "Hakkımızda", "İletişim"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hakkımızda"),
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    "Vizyon",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "En yenilikçi teknolojileri kullanarak, müşterilerimizin ihtiyaçlarına uygun çözümler üretmek.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    "Misyon",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Müşterilerimize en iyi hizmeti sunarak, onların işlerini daha kolay hale getirmek ve değer katmak.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
