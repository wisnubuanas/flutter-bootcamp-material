import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

class CVresume extends StatelessWidget {
  const CVresume({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Curiculum Vitae - Wisnu BS",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.person),
          title: Text(
            "Curiculum Vitae",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.person,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {},
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: _buildHeader(),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Text(
                    "Saya fresh graduate yang suka menonton anime setiap hari. Semua anime saya tonton. Cita-cita saya menjadi anime terkuat di muka bumi ini"),
              ),
              _buildTitle("Skills"),
              SizedBox(
                height: 10,
              ),
              _buildSkillRow("Photoshop", 0.5),
              SizedBox(
                height: 5,
              ),
              _buildSkillRow("Ms. Office", 0.75),
              SizedBox(
                height: 5,
              ),
              _buildSkillRow("Premiere Pro", 0.25),
              SizedBox(
                height: 30,
              ),
              _buildTitle("Experience"),
              // SizedBox(
              //   height: 10,
              // ),
              _buildExperienceRow(
                  company: "Himpunan Mahasiswa Instrumentasi dan Elektronika",
                  position: "Networking Information Communication",
                  duration: "Jan 2019 - Dec 2019"),
              _buildExperienceRow(
                  company: "Keluarga Mahasiswa Tembalang Kudus",
                  position: "Media dan Informasi",
                  duration: "July 2020 - June 2021"),
              SizedBox(
                height: 20,
              ),
              _buildTitle("Education"),
              _buildExperienceRow(
                  company: "Politeknik Gajah Tunggal",
                  position: "Coding Class",
                  duration: "Sep 2022 - Now"),
              _buildExperienceRow(
                  company: "Universitas Diponegoro",
                  position: "D3 - Instrumentasi dan Elektronika",
                  duration: "Aug 2018 - Feb 2022"),
              _buildExperienceRow(
                  company: "SMA 1 Kudus",
                  position: "Matematika dan IPA",
                  duration: "July 2015 - June 2018"),
              SizedBox(
                height: 20,
              ),
              _buildTitle("Contacs"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.email,
                    color: Colors.red,
                    // size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "wisnubuanas@gmail.com",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                    // size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("+6281XXXXXXXXX", style: TextStyle(fontSize: 15)),
                ],
              ),
              // ListTile(
              //   contentPadding: const EdgeInsets.all(0),
              //   leading: Padding(
              //     padding: const EdgeInsets.only(top: 6.0, left: 20),
              //     child: Icon(
              //       Icons.email,
              //       color: Colors.red,
              //       size: 20,
              //     ),
              //   ),
              //   title: Text(
              //     "wisnubuanas@gmail.com",
              //     style: TextStyle(fontSize: 14),
              //   ),
              // ),
              // ListTile(
              //   contentPadding: const EdgeInsets.all(0),
              //   leading: Padding(
              //     padding: const EdgeInsets.only(top: 6.0, left: 20),
              //     child: Icon(
              //       Icons.phone,
              //       color: Colors.blue,
              //       size: 20,
              //     ),
              //   ),
              //   title: Text(
              //     "+62 81XXXXXXXXX",
              //     style: TextStyle(fontSize: 14),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    color: Colors.indigo,
                    icon: Icon(FontAwesomeIcons.facebookF),
                    onPressed: () {
                      _launchURL("https://facebook.com/wisnu.buanas");
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      color: Colors.indigo,
                      onPressed: () {
                        _launchURL("https://github.com/wisnubuanas");
                      },
                      icon: Icon(FontAwesomeIcons.github)),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      color: Colors.red.shade300,
                      onPressed: () {
                        _launchURL("https://instagram.com/buanawisnuu");
                      },
                      icon: Icon(FontAwesomeIcons.instagram)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow(
      {required String company,
      required String position,
      required String duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20),
        child: Icon(
          Icons.circle,
          size: 12,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: [
        SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              value: level,
              color: Colors.indigo,
            )),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(backgroundImage: AssetImage("images/031.jpg"))),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wisnu Buana Sakti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "(ウィスヌ・ブアナ・サクティ)",
              style: TextStyle(fontSize: 11),
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   "Fresh Graduate",
            //   style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 14,
                ),
                Text(
                  "Tangerang, Indonesia",
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
