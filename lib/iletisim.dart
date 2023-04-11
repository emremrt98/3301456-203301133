import 'package:flutter/material.dart';
import 'package:multi_app/hakkimizda.dart';
import 'package:multi_app/anasayfa.dart';

class Iletisim extends StatelessWidget {
  final List<String> menuItems = ["Anasayfa", "Hakkımızda", "İletişim"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("İletişim"),
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
            children: [
              Expanded(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Ad Soyad",
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "E-posta",
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        maxLines: 1,
                        decoration: const InputDecoration(
                          labelText: "Mesaj",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Gönder"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
