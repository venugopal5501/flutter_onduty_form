import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('OD FORM')),
        backgroundColor: Colors.green,
        body: const Center(child: GenerateButton()),
      ),
    );
  }
}

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key});

  Future<void> generatePdfAndPrint() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 20),
              pw.Center(
                child: pw.Text(
                  "ST . XAVIER'S CATHOLIC COLLEGE OF ENGINEERING",
                  style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 6),
              pw.Center(
                child: pw.Text(
                  "Chunkankadai, Nagercoil - 629 003",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                ),
                child: pw.Center(
                  child: pw.Text(
                    "STUDENT ON OTHER DUTY REQUEST",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.SizedBox(height: 6),
              pw.Center(
                child: pw.Text(
                  "(To be submitted to the HOD/Tutor in person well in advance)",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                columnWidths: {
                  0: const pw.FixedColumnWidth(100),
                  1: const pw.FixedColumnWidth(100),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Date :',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(' Time :'),
                    ],
                  ),
                  for (var i = 0; i < 1; i++)
                    pw.TableRow(
                      children: [
                        pw.Text(
                          ' S.No.  ',
                          style: const pw.TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        pw.Text(''),
                      ],
                    ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Name',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(''),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Roll Number',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(''),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Department / Year',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(''),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' No. days / Hours Required',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' No. of days / hours already availed',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(''),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Duty Date / Time',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(
                        ' From :                            To : ',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Purpose : ',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text('   '),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        ' Recommended by\n Name     :\n Signature  :',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      pw.Text(
                        '\n \n \n                     Signature of Applicant  ',
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(
                        " Signature of HOD : ",
                        style: const pw.TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
    final pdfBytes = pdf.save();

    // Print using the printing package
    await Printing.layoutPdf(onLayout: (format) async => pdfBytes);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: generatePdfAndPrint,
      child: const Text('Print'),
    );
  }
}
