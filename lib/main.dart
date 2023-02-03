// ignore_for_file: prefer_const_con, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'about.dart';
import 'display_page.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String assetPdfPath = '';
  String assetPdfPath1 = '';
  var pdf = {
    "Grade 1": {
      "አማርኛ": "1amh",
      "English": "1eng",
      "ሒሳብ": "1mat",
      "አካባቢ ሳይንስ": "1sie",
    },
    "Grade 2": {
      "አማርኛ": "2amh",
      "English": "2eng",
      "ሒሳብ": "2mat",
      "አካባቢ ሳይንስ": "2sie",
    },
    "Grade 3": {
      "አማርኛ": "3amh",
      "English": "3eng",
      "ሒሳብ": "3mat",
      "አካባቢ ሳይንስ": "3sie",
    },
    "Grade 4": {
      "አማርኛ": "4amh",
      "English": "4eng",
      "ሒሳብ": "4mat",
      "አካባቢ ሳይንስ": "4sie",
    },
    "Grade 5": {
      "አማርኛ": "5amh",
      "English": "5eng",
      "ሒሳብ": "5mat",
      "አካባቢ ሳይንስ": "5sie",
    },
    "Grade 6": {
      "አማርኛ": "6amh",
      "English": "6eng",
      "ሒሳብ": "6mat",
      "አካባቢ ሳይንስ": "6sie",
    },
    "Grade 7": {
      "አማርኛ": "7amh",
      "English": "7eng",
      "Mathematics": "7mat",
      "General Science": "7sie",
      "Social Studies": "7soc",
      "Citizenship Education": "7cit",
      "Career and Technical Education": "7car",
      "ICT": "7ict",
    },
    "Grade 8": {
      "አማርኛ": "8amh",
      "English": "8eng",
      "Mathematics": "8mat",
      "General Science": "8sie",
      "Social Studies": "8soc",
      "Citizenship Education": "8cit",
      "Career and Technical Education": "8car",
      "ICT": "8ict",
    },
  };
  var selectedItem = '';
  List<String> items = ['Add'];
  String? SelectedItem = 'Add';
  bool click = false;

  Future<File> getFileFromAsset(String asset, String element) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/${element}');
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception('Error opening file!');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 134, 129, 142),
        appBar: AppBar(
          title: Text('Textbooks'),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  selectedItem = value.toString();
                  if (selectedItem == "About") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => about()),
                    );
                  }
                });
              },
              itemBuilder: (BuildContext bc) {
                return [
                  PopupMenuItem(value: "About", child: Text('About As')),
                ];
              },
            )
          ],
          backgroundColor: Colors.black,
          foregroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          physics: BouncingScrollPhysics(),
          children: Books(),
        ));
  }

  List<Widget> Books() {
    List<Widget> rows = List<Widget>.empty(growable: true);
    for (var book in pdf.entries) {
      //here book is map of all books having grade as key and array of books for that grade
      rows.add(Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 0.6,
              color: Colors.black,
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 25,
              width: 330,
              color: Color.fromARGB(255, 8, 21, 14),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: book.key,
                    style: TextStyle(
                      fontFamily: 'New Time Roman',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 239, 239),
                    ),
                  ),
                  TextSpan(
                    text: '  Textbooks',
                    style: TextStyle(
                      fontFamily: 'New Time Roman',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 239, 239),
                    ),
                  ),
                ]),
              )),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 0.6,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: false,
                  children: Books1(book.value, book.key)),
            ),
          ),
        ],
      ));
    }
    return rows;
  }

//this renders each book in the book list
  List<Widget> Books1(var value, var grade) {
    //here value is array of book
    List<Widget> rows = List<Widget>.empty(growable: true);
    for (var element in value.entries) {
      //subject name element.key
      //subject pic and file path element.value
      rows.add(Row(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    element.key,
                    style: TextStyle(
                      fontFamily: 'Time New Roman',
                      fontSize: 14,
                      color: Color.fromARGB(255, 75, 3, 200),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage('assets/images/${element.value}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    focusColor: Color.fromARGB(255, 18, 17, 17),
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 5, 38, 6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Open',
                        style: TextStyle(
                          fontFamily: 'valera',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      getFileFromAsset(
                          'assets/books/${element.value}.pdf', "element")
                          .then((f) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => display_page(
                                    path: f.path,
                                    grade: grade,
                                    subject: element.key)));
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ));
    }
    return rows;
  }
}
