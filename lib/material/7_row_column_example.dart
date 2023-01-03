import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowColumnExample extends StatelessWidget {
  RowColumnExample({super.key});

  Widget rowExample = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [BlueBox(), BlueBox(), BlueBox()],
  );

  Widget columnExample = SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [BlueBox(), BlueBox(), BlueBox()],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: columnExample),
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}

class RowColumnPractice extends StatelessWidget {
  const RowColumnPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/logoancol.png',
                height: 90,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ancol",
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Destinasi di tepi laut Ancol memiliki pantai yang populer untuk olahraga air dan kompleks di tepi laut yang dilengkapi rollercoaster serta wahana di Dunia Fantasi dan taman rekreasi air Atlantis Water Adventure. Keluarga juga dapat menikmati akuarium SeaWorld dengan hiu dan kura-kuranya, serta Ocean Dream Samudra yang menampilkan pertunjukan lumba-lumba dan singa laut. Pasar Seni Ancol menampilkan seniman lokal yang baru muncul dan mengadakan pertunjukan tarian di akhir pekan",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              // Spacer(
              //   flex: 2,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ulasan: "),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star),
                    ],
                  ),
                  Text("dari 36 pengulas"),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              // Spacer(
              //   flex: 1,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.location_pin),
                      Text("DISTANCE"),
                      Text("10 Km")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.label),
                      Text("TICKETS"),
                      Text("Rp. 25.000")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.access_time),
                      Text("OPEN"),
                      Text("09:00 AM")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
