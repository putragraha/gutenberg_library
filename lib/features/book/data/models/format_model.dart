import 'package:equatable/equatable.dart';

class FormatModel extends Equatable {

  final String? xMobipocketEBook;

  final String? ePubZip;

  final String? rdfXml;

  final String? textHtmlUtf8;

  final String? textHtml;

  final String? zip;

  final String? textPlain;

  final String? imageJpeg;

  const FormatModel({
    this.xMobipocketEBook,
    this.ePubZip,
    this.rdfXml,
    this.textHtmlUtf8,
    this.textHtml,
    this.zip,
    this.textPlain,
    this.imageJpeg
  });

  @override
  List<Object?> get props => [
    xMobipocketEBook,
    ePubZip,
    rdfXml,
    textHtmlUtf8,
    textHtml,
    zip,
    textPlain,
    imageJpeg
  ];


  factory FormatModel.fromJson(Map<String, dynamic> jsonMap) {
    return FormatModel(
      xMobipocketEBook: jsonMap["application/x-mobipocket-ebook"],
      ePubZip: jsonMap["application/epub+zip"],
      rdfXml: jsonMap["application/rdf+xml"],
      textHtmlUtf8: jsonMap["text/html; charset=utf-8"],
      textPlain: jsonMap["text/plain; charset=utf-8"],
      imageJpeg: jsonMap["image/jpeg"],
      textHtml: jsonMap["text/html"]
    );
  }
}
