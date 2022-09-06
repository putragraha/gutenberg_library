import 'package:equatable/equatable.dart';

class Format extends Equatable {

  final String? xMobipocketEBook;

  final String? ePubZip;

  final String? rdfXml;

  final String? textHtmlUtf8;

  final String? textHtml;

  final String? zip;

  final String? textPlain;

  final String? imageJpeg;

  const Format({
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
}
