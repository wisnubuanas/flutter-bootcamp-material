// import 'package:flutter/material.dart';

// class TweenAnimationExample extends StatefulWidget {
//   const TweenAnimationExample({super.key});

//   @override
//   State<TweenAnimationExample> createState() => _TweenAnimationExampleState();
// }

// class _TweenAnimationExampleState extends State<TweenAnimationExample> {
//   double size1 = 200;
//   double size2 = 100;

//   void _sizeChange() {
//     setState(() {
//       double temp = size1;
//       size1 = size2;
//       size2 = temp;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TweenAnimationBuilder<double>(
//                 tween: Tween<double>(begin: size1, end: size2),
//                 duration: Duration(seconds: 1),
//                 curve: Curves.fastOutSlowIn,
//                 builder: (context, value1, child) {
//                   return TweenAnimationBuilder<double>(
//                     tween: Tween<double>(begin: size2, end: size1),
//                     duration: Duration(seconds: 1),
//                     curve: Curves.fastOutSlowIn,
//                     builder: (context, value2, child) {
//                       return Container(
//                         width: value1,
//                         height: value2,
//                         decoration: BoxDecoration(color: Colors.amber),
//                       );
//                     },
//                   );
//                 },
//                 onEnd: () => _sizeChange(),
//                 child: Container(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(const TweenAnimationExample());

class TweenAnimationExample extends StatelessWidget {
  const TweenAnimationExample({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPadding(
          padding: EdgeInsets.all(padValue),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            color: Colors.blue,
          ),
        ),
        Text('Padding: $padValue'),
        ElevatedButton(
            child: const Text('Change padding'),
            onPressed: () {
              _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
            }),
      ],
    );
  }
}
