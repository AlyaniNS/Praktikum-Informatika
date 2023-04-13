// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:postest6_2009106100_alyani/page/NavBar.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  String namaUser = " ";
  String? filmDipilih = " ";
  String? jamDipilih = " ";

  TextEditingController nama = TextEditingController();

  List<String> film = [
    'Jujutsu Kaisen 0',
    'The Batman',
    'Fantastic Beasts: Secret of Dumbledore',
    'Morbius',
    'Sonic 2'
  ];

  List<String> jam = ['10:00', '12:00', '14:00', '16:00', '20:00'];

  @override
  void dispose() {
    //implement dispose
    nama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 133, 173, 169),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 240, 242, 202),
            title: Text(
              'Pesan Tiket',
              style: TextStyle(color: Color.fromARGB(255, 133, 173, 169)),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DropdownSearch<String>(
                  showClearButton: true,
                  popupProps: PopupProps.menu(
                    showSelectedItems: false,
                    showSearchBox: false,
                  ),
                  items: film,
                  dropdownSearchDecoration: InputDecoration(
                      prefixIcon: Icon(Icons.movie),
                      labelText: "Film",
                      hintText: "Pilih Film",
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
                  onChanged: print,
                  selectedItem: filmDipilih!,
                ),
                SizedBox(height: 20),
                //dropdown jam
                DropdownSearch<String>(
                  showClearButton: true,
                  popupProps: PopupProps.menu(
                    showSelectedItems: false,
                    showSearchBox: false,
                  ),
                  items: jam,
                  dropdownSearchDecoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      labelText: "Jam",
                      hintText: "Pilih jam tayang",
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
                  onChanged: print,
                  selectedItem: jamDipilih!,
                ),
                SizedBox(height: 20),
                //Field nama
                TextFormField(
                  cursorHeight: 18,
                  style: TextStyle(
                    fontFamily: "Poppins",
                  ),
                  controller: nama,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      labelText: "Nama",
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
                        filmDipilih = filmDipilih!;
                        jamDipilih = jamDipilih!;
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
                                  builder: (context) => NavBar(),
                                ),
                              ),
                              child: Text("Menu"),
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
              ],
            ),
          ),
        ));
  }
}
