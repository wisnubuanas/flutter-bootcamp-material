import 'package:flutter/material.dart';

// class user {
//   String name
// int age
// }
class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Halaman 1")),
        body: SafeArea(
          child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => PageTwo()));
                    Navigator.pushNamed(context, "/pagetwo");
                  },
                  child: Text("Halaman 2"))),
        ));
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Halaman 2"),
      ),
      body: SafeArea(
          child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("back")))),
    );
  }
}

class NavExample extends StatelessWidget {
  const NavExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageOne(),
    );
  }
}

class RoutExample extends StatelessWidget {
  const RoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/": (context) => PageOne(), "/pagetwo": (context) => PageTwo()},
      initialRoute: "/",
    );
  }
}
