import 'package:flutter/material.dart';


class NotHesaplama extends StatefulWidget {
  @override
  _NotHesaplamaState createState() => _NotHesaplamaState();
}

class _NotHesaplamaState extends State<NotHesaplama> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController vizeController = TextEditingController();
  TextEditingController finalController = TextEditingController();
  TextEditingController odevController = TextEditingController();

  double vize = 0;
  double finalnotu = 0;
  double odev = 0;
  double ortalama = 0;

  void _hesapla() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        vize = double.tryParse(vizeController.text ?? '0') ?? 0;
        finalnotu = double.tryParse(finalController.text ?? '0') ?? 0;
        odev = double.tryParse(odevController.text ?? '0') ?? 0;

        ortalama = vize * 0.3 + finalnotu * 0.6 + odev * 0.1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Hesaplama'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Vize',
                ),
                controller: vizeController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Lütfen bir değer girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Final',
                ),
                controller: finalController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Lütfen bir değer girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ödev',
                ),
                controller: odevController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Lütfen bir değer girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _hesapla,
                child: Text('Hesapla'),
              ),
              SizedBox(height: 20),
              ortalama == null
                  ? Container()
                  : Text(
                      'Ortalama: ${ortalama.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
