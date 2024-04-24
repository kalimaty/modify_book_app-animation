import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salwa_poklet/animation/flutter_start_up_animation.dart';
import 'package:salwa_poklet/api/api_pdf.dart';

import 'pages/pdf_viwer_page.dart';
import 'widgets/button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'بوكلت  الثانوية الأزهرية علمى 2024'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late StartUpAnimation startupAnimation;
  late AnimationController animationController;
  void openPDF(BuildContext context, File file) {
    Navigator.of(context)
        .push(
            MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)))
        .then((result) {
      _createStartUpAnimation();
    });
  }

  @override
  void dispose() {
    // Dispose animation controller
    animationController.dispose();
    super.dispose();
  }

  void _createStartUpAnimation() {
    animationController.reset();
    // Start animation
    Future.delayed(const Duration(seconds: 1), () {
      // print('One second has passed.'); // Prints after 1 second.
      animationController.forward();
    });
    setState(() {
      startupAnimation = StartUpAnimation(
        crossAxisCount: 3,
        animationController: animationController,
        children: <Widget>[
          ButtonWidget(
            text: 'الأحياء',
            onClicked: () async {
              final path = 'assets/الأحياء.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),
          // SizedBox(
          //   height: 16,
          // ),
          ButtonWidget(
            text: 'الفيزياء',
            onClicked: () async {
              final path = 'assets/الفيزياء.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),

          ButtonWidget(
            text: 'استاتيكا',
            onClicked: () async {
              final path = 'assets/الاستاتيكا.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),

          ButtonWidget(
            text: 'الديناميكا',
            onClicked: () async {
              final path = 'assets/الديناميكا.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),

          ButtonWidget(
            text: 'تفاضلِ  \n \وتكامل ',
            onClicked: () async {
              final path = 'assets/تفاضل وتكامل.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),
          ButtonWidget(
            text: 'الجبر والهندسة',
            onClicked: () async {
              final path = 'assets/جبر وهندسة.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),

          ButtonWidget(
            text: 'انجليزى',
            onClicked: () async {
              final path = 'assets/الانجليزية.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),
          ButtonWidget(
            text: 'الكيمياء',
            onClicked: () async {
              final path = 'assets/الكمياء.pdf';
              final file = await PDFApi.loadAsset(path);
              openPDF(context, file);
            },
          ),

          // ButtonWidget(
          //   text: 'open File',
          //   onClicked: () async {
          //     final file = await PDFApi.pickFile();
          //     if (file == null) return null;
          //     openPDF(context, file);
          //   },
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          // SizedBox(

          //   height: 16,
          // ),
        ],
        animationDuration: 4,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // or any other duration you prefer
    );
    _createStartUpAnimation();
  }

  @override
  Widget build(BuildContext context) {
    //  final color = Theme.of(context).colorScheme.primaryContainer;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // backgroundColor: Color.fromARGB(105, 135, 14, 185),
        backgroundColor: Color.fromARGB(103, 159, 14, 185),

        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        toolbarHeight: 50,
      ),
      body: startupAnimation,
    );
  }
}
