import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum AnimationType {
  rive,
  lottie;

  bool get isRive => this == AnimationType.rive;
  bool get isLottie => this == AnimationType.lottie;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AnimationType _animationType = AnimationType.rive;

  void _toggleAnimationType() {
    setState(() {
      _animationType =
          _animationType.isRive ? AnimationType.lottie : AnimationType.rive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.square(
              dimension: 400,
              child: _animationType.isRive
                  ? const RiveAnimation.asset(
                      'assets/thank_you.riv',
                    )
                  : Lottie.asset(
                      'assets/thank_you.json',
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimationType,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
