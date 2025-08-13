import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';

class LirePage extends StatefulWidget {
  const LirePage({super.key});

  @override
  State<LirePage> createState() => _LirePageState();
}

class _LirePageState extends State<LirePage> {

  PdfController? _pdfController;
  bool _loading = true;
  final String pdfUrl = "https://www.example.com/monfichier.pdf";

  @override
  void initState() {
    super.initState();
    _loadPdfFromUrl();
  }

  Future<void> _loadPdfFromUrl() async {
    try {
      // Télécharger le PDF depuis l'URL
      final response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode == 200) {
        setState(() {
          _pdfController = PdfController(
            document: PdfDocument.openData(response.bodyBytes),
            initialPage: 1,
          );
          _loading = false;
        });
      } else {
        throw Exception("Erreur de téléchargement du PDF");
      }
    } catch (e) {
      debugPrint("Erreur: $e");
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Lecture")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : PdfView(
            controller: _pdfController!,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
