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
  Duration duration = const Duration(milliseconds: 500);

  double? containerHeight = 0;
  String title = "titulo";
  String text =
      "Lorem Ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus accumsan, mauris eget tincidunt ultricies, erat nunc tempor augue, non vehicula dolor lectus et arcu. Suspendisse potenti. Sed venenatis, quam vitae ultrices dictum, enim justo posuere est, ac hendrerit elit nisl non justo.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(
            25,
          ),
          child: Column(
            children: [
              CustomTileWidget(
                duration: duration,
                title: "Titulo",
                text:
                    "Which, as a child of a Stack, automatically transitions its child's position over a given duration whenever the given position changes.",
              ),
              CustomTileWidget(
                duration: duration,
                title: "Titulo",
                text:
                    "Which, as a child of a Stack, automatically transitions its child's position over a given duration whenever the given position changes.",
              ),
            ],
          )),
    );
  }
}

class CustomTileWidget extends StatefulWidget {
  const CustomTileWidget({
    super.key,
    required this.duration,
    required this.title,
    required this.text,
  });

  final Duration duration;
  final String title;
  final String text;

  @override
  State<CustomTileWidget> createState() => _CustomTileWidgetState();
}

class _CustomTileWidgetState extends State<CustomTileWidget> {
  double turns = 0;
  double containerHeight = 0;

  expandTile(Size size) {
    if (turns == 0) {
      turns = 0.5;
      containerHeight = widget.text.length.toDouble() / 3;
    } else {
      turns = 0;
      containerHeight = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              expandTile(
                size,
              );
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              AnimatedRotation(
                duration: widget.duration,
                turns: turns,
                child: const Icon(
                  Icons.keyboard_arrow_down,
                ),
              )
            ],
          ),
        ),
        AnimatedContainer(
          duration: widget.duration,
          curve: Curves.ease,
          height: containerHeight,
          child: Text(widget.text),
        ),
      ],
    );
  }
}
