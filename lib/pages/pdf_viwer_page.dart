import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({
    Key? key,
    @required this.file,
  }) : super(key: key);

  final File? file;

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController? controller;
  int indexPage = 0;
  int pages = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file!.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop("resultData");
          },
        ),
        backgroundColor: Color.fromARGB(103, 159, 14, 185),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        title: Text(
          '${name} ',
        ),
        // centerTitle: true,
        actions: pages >= 2
            ? [
                Center(
                    child: Text(
                  text.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller!.setPage(page);
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, size: 30),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller!.setPage(page);
                  },
                  color: Colors.white,
                ),
              ]
            : null,
      ),
      body: PDFView(
        // fitEachPage: true,
        filePath: widget.file!.path, enableSwipe: true,
        // autoSpacing: false,
        // swipeHorizontal: true,
        // pageSnap: false,
        // pageFling: false,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }
}
