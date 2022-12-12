import 'package:flutter/material.dart';

void main() {
  runApp(const Konversi());
}

class Konversi extends StatelessWidget {
  const Konversi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Konversi',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _nilai_input = 0.0;
  String _satuanAsal = 'meter';
  String _satuanTujuan = 'meter';
  String _nama = '';
  final List<String> _satuan = [
    'meter',
    'kilometer',
    'gram',
    'kilogram',
    'feet',
    'mile',
    'pound',
    'ounce',
    'ider',
    'usd',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Konversi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("Selamat Datang diaplikasi konversi"),
              Spacer(), //jarak antar widget
              TextField(
                decoration:
                    InputDecoration(hintText: 'Silahkan input Nama Anda'),
                onChanged: (text) {
                  var textInput = text;
                  if (textInput != null) {
                    setState(() {
                      _nama = textInput;
                    });
                  }
                },
              ), //nama
              Spacer(),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Silahkan input Nilai yang akan dikonversi'),
                onChanged: (text) {
                  var dataInput = double.tryParse(text);
                  if (dataInput != null) {
                    setState(() {
                      _nilai_input = dataInput;
                    });
                  }
                },
              ),
              Spacer(),
              Text("Satuan Asal"),
              DropdownButton(
                isExpanded: true,
                value: _satuanAsal,
                items: _satuan.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _satuanAsal = value.toString();
                  });
                },
              ),
              Text("Satuan Tujuan"),
              DropdownButton(
                isExpanded: true, //memanjangkan ukuran sesuai layar
                value: _satuanTujuan,
                items: _satuan.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _satuanTujuan = value.toString();
                  });
                },
              ), //satuan asal
              Spacer(
                flex: 2,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Hitung')),
              Spacer(
                flex: 2,
              ),
              Text("Heloo ${_nama}, ${_nilai_input}"), //satuan tujuan
            ],
          ),
        ),
      ),
    );
  }
}
