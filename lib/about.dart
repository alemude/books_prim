// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
//import 'package:telegram/telegram.dart';
//import 'package:linkedin_login/linkedin_login.dart';

import 'main.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  final phone = '+251936347251';
  final  linkedin = 'alemu-derebe-1b0480247';
  final telegram = '@alemu21';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 202, 196),
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
          'About As',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/me.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 195, 71, 30)),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Alemu Derebe',
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromARGB(255, 23, 15, 19)!,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Alemu Derebe',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 232, 228, 228),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: <Widget>[
                Text(
                  'Graduated at Bahir dar University',
                  style: TextStyle(
                    fontSize: 15,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromARGB(255, 109, 154, 210)!,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Graduated at Bahir dar University',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 215, 34, 143),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: <Widget>[
                Text(
                  'Working at Dan Energy Ethiopia',
                  style: TextStyle(
                    fontSize: 16,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromARGB(255, 211, 213, 215)!,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Working at Dan Energy Ethiopia',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 34, 215, 67),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 190,
            ),
            Stack(
              children: <Widget>[
                Text(
                  'Contact me with',
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Color.fromARGB(255, 201, 139, 14)!,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Contact me with',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 4, 29, 75),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    launch('tel://$phone');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 21, 216, 73),
                        ),
                        child: const Icon(
                          Icons.call,
                          color: Color.fromARGB(255, 249, 252, 250),
                          size: 40,
                        ),
                      ),
                      Text(
                        'Phone',
                        style: TextStyle(
                          color: Color.fromARGB(255, 14, 204, 81),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    launch('sms://$phone');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 21, 216, 73),
                        ),
                        child: const Icon(
                          Icons.message,
                          color: Color.fromARGB(255, 40, 99, 199),
                          size: 40,
                        ),
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 99, 199),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    launch('mailto:alemude21@gmail.com');
                  }, child:
              Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 3, 17, 27),
                          image: DecorationImage(
                            image: AssetImage('assets/images/email.webp'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 123, 7),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    launch('tg:telegram');
                  }, child:
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/telegram.png')),
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 11, 226, 133),
                      ),
                    ),
                    Text(
                      'Telegram',
                      style: TextStyle(
                        color: Color.fromARGB(255, 21, 119, 118),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(
                  width:10,
                ),
                InkWell(
                  onTap: () async {
                    launch('linkedin:linkedin');
                  }, child:
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/linkedin.png')),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'LinkedIn',
                      style: TextStyle(
                        color: Color.fromARGB(255, 72, 31, 238),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
