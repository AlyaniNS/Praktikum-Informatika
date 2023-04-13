import 'package:flutter/material.dart';

class PageTwoInput extends StatefulWidget {
  const PageTwoInput({Key? key}) : super(key: key);

  @override
  State<PageTwoInput> createState() => _PageTwoInputState();
}

class _PageTwoInputState extends State<PageTwoInput> {
  String film = "Jujutsu Kaisen 0";
  String jam = "10:00";
  String namaUser = " ";

  TextEditingController nama = TextEditingController();

  var daftarFilm = [
    'Jujutsu Kaisen 0',
    'The Batman',
    'Fantastic Beasts: Secret of Dumbledore',
    'Morbius',
    'Sonic 2'
  ];

  var daftarJam = ['10:00', '12:00', '14:00', '16:00', '20:00'];

  @override
  void dispose() {
    //implement dispose
    nama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 199, 93, 33),
              title: Text(
                'Booking Page',
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  //Dropdown judul film
                  Text("Film"),
                  DropdownButton(
                      value: film,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: daftarFilm.map((String daftarFilm) {
                        return DropdownMenuItem(
                          child: Text(daftarFilm),
                          value: daftarFilm,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          film = newValue!;
                        });
                      }),
                  //Dropdown jam
                  Text("Jam Tayang"),
                  DropdownButton(
                      value: jam,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: daftarJam.map((String daftarJam) {
                        return DropdownMenuItem(
                          child: Text(daftarJam),
                          value: daftarJam,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          jam = newValue!;
                        });
                      }),
                  //Field nama
                  TextFormField(
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                    controller: nama,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nama",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 199, 93, 33),
                        padding: EdgeInsets.all(10),
                        fixedSize: Size(40, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          namaUser = nama.text;
                        });
                      },
                      child: Text(
                        'Pesan Tiket',
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "\n\nNama : $namaUser"
                    "\nFilm : $film"
                    "\nJam : $jam",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )));
  }
}
