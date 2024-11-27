import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animações implicitas',
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
  int alignmentValue = 0;
  double widthCotainerValue = 100;
  double borderRadiusValue = 200;
  @override
  Widget build(BuildContext context) {
    List<Alignment> alignments = [
      Alignment.bottomRight,
      Alignment.topCenter,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: alignments[alignmentValue],
              duration: const Duration(
                seconds: 2,
              ),
              child: InkWell(
                onTap: () {
                  if (alignmentValue == 0) {
                    setState(() {
                      widthCotainerValue = 200;
                      borderRadiusValue = 0;
                      alignmentValue = 1;
                    });
                  } else {
                    setState(() {
                      widthCotainerValue = 100;
                      borderRadiusValue = 200;
                      alignmentValue = 0;
                    });
                  }
                },
                child: AnimatedContainer(
                  height: 100,
                  width: widthCotainerValue,
                  duration: const Duration(
                    seconds: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      borderRadiusValue,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
