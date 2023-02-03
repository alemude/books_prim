// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'main.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
    ),
  );
}

class display_page extends StatefulWidget {
  final String path;
  final String grade;
  final String subject;

  const display_page(
      {super.key,
      required this.path,
      required this.grade,
      required this.subject});

  @override
  State<display_page> createState() => _display_pageState();
}

class _display_pageState extends State<display_page> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;

  get selectedItem => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 129, 142),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 246, 243, 243),
            size: 30,
          ),
        ),
        title: Text(
          ' ${widget.grade} ${widget.subject} Textbook',
          style: TextStyle(
            fontFamily: '',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PDFView(
              filePath: widget.path,
              autoSpacing: true,
              enableSwipe: true,
              pageSnap: true,
              swipeHorizontal: true,
              onError: (e) {
                print(e);
              },
              onRender: (_pages) {
                setState(() {
                  _totalPages = _pages!;
                  pdfReady = true;
                });
              },
              onViewCreated: (PDFViewController vc) {
                _pdfViewController = vc;
              },
// onPageChanged: (int page, int total) {
// setState(() {

// });
// },
              onPageError: (page, error) {}),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15,
          ),
          _currentPage < _totalPages
              ? FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Color.fromARGB(255, 223, 27, 105),
                  label: Text('Back'),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage < _totalPages
              ? FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Color.fromARGB(255, 4, 55, 5),
                  label: Text('Next'),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          SizedBox(
            width: 0,
          ),
        ],
      ),
    );
  }
}
