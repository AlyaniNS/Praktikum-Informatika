import 'package:flutter/material.dart';
import 'package:postest5_2009106100_alyani/TicketPage.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
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
            backgroundColor: Color.fromARGB(255, 133, 173, 169),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 240, 242, 202),
              title: Text(
                'Pesan Tiket',
                style: TextStyle(color: Color.fromARGB(255, 133, 173, 169)),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  //Dropdown judul film
                  Text(
                    "Film",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                      dropdownColor: Color.fromARGB(255, 133, 173, 169),
                      value: film,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 240, 242, 202),
                      ),
                      items: daftarFilm.map((String daftarFilm) {
                        return DropdownMenuItem(
                          child: Text(
                            daftarFilm,
                            style: TextStyle(
                                color: Color.fromARGB(255, 240, 242, 202)),
                          ),
                          value: daftarFilm,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          film = newValue!;
                        });
                      }),
                  //Dropdown jam
                  Text(
                    "Jam Tayang",
                    style: TextStyle(color: Colors.white),
                  ),
                  DropdownButton(
                      dropdownColor: Color.fromARGB(255, 133, 173, 169),
                      value: jam,
                      icon:
                          Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      items: daftarJam.map((String daftarJam) {
                        return DropdownMenuItem(
                          child: Text(
                            daftarJam,
                            style: TextStyle(
                                color: Color.fromARGB(255, 240, 242, 202)),
                          ),
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
                        fillColor: Colors.white,
                        filled: true,
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: "Nama",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 133, 173, 169),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 240, 242, 202)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 120, right: 120),
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 240, 242, 202),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          namaUser = nama.text;
                        });
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Tiket berhasil dipesan"),
                            content: Text("Tiket bisa dilihat di menu tiket"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TicketPage(),
                                  ),
                                ),
                                child: Text("Lihat tiket"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Pesan',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 133, 173, 169)),
                      ),
                    ),
                  ),
                  Text(
                    "\n\nNama : $namaUser"
                    "\nFilm : $film"
                    "\nJam : $jam",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )));
  }
}
