import "package:flutter/material.dart";

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  static const routeName = "/";

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<User> data = [User(name: "tes1", age: 12), User(name: "tes2", age: 22)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman 1")),
      body: SafeArea(
          child: ListView(
        children: [
          ListTile(
            title: Text(data[0].name),
            onTap: () async {
              User result = await Navigator.pushNamed(
                  context, PageTwo.routeName,
                  arguments: data[0]) as User;
              setState(() {
                data[0].name = result.name;
              });
            },
          ),
          ListTile(
            title: Text(data[1].name),
            onTap: () async {
              // Navigator.pushNamed(context, PageTwo.routeName,
              //     arguments: data[1]);
              User result = await Navigator.pushNamed(
                  context, PageTwo.routeName,
                  arguments: data[1]) as User;
              setState(() {
                data[1].name = result.name;
              });
            },
          )
        ],
      )
          //     child: Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Navigator.of(context).push(MaterialPageRoute(
          //       //   builder: (context) => PageTwo(),
          //       // ));
          //       Navigator.pushNamed(context, "/pagetwo");
          //     },
          //     child: Text("halaman 2"),
          //   ),
          // )
          ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  static const routeName = "/pagetwo";

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  @override
  Widget build(BuildContext context) {
    User param = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            param.name = "data berubah";
            Navigator.pop(context, param);
          },
        ),
        title: Text(param.name),
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [Text("${param.age}")],
      ))),
    );
  }
}

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageOne(),
    );
  }
}

class RouteExample extends StatelessWidget {
  const RouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PageOne.routeName: (context) => PageOne(),
        PageTwo.routeName: (context) => PageTwo()
      },
      initialRoute: PageOne.routeName,
      // home: ,
    );
  }
}
