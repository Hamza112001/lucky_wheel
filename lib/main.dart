import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottery_wheel_assignment/lottery_wheel.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final angle = 2 * pi;
  Tween<double> myTween = Tween(begin: 1, end: 1);
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            TweenAnimationBuilder(
              tween: myTween,
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Transform.rotate(angle: value, child: child);
              },
              child: CustomPaint(
                painter: MyLotteryWheelPainter(),
                child: const SizedBox(
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    myTween = Tween(begin: 1, end: 100 * pi);
                  });
                },
                child: const Text('START')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('STOP'))
          ],
        ),
      ),
    );
  }
}
