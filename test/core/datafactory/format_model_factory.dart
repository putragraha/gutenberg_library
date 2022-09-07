import 'package:gutenberg_library/features/book/data/models/format_model.dart';

class FormatModelFactory {

  static FormatModel newFormatModel({
    String? withXMobipocketEBook = "https://www.gutenberg.org/ebooks/1342.kindle.images",
    String? withEPubZip = "https://www.gutenberg.org/ebooks/1342.epub.images",
    String? withRdfXml = "https://www.gutenberg.org/ebooks/1342.rdf",
    String? withTextHtmlUtf8 = "https://www.gutenberg.org/files/1342/1342-h/1342-h.htm",
    String? withTextPlain = "https://www.gutenberg.org/files/1342/1342-0.txt",
    String? withImageJpeg = "https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg",
    String? withTextHtml = "https://www.gutenberg.org/ebooks/1342.html.images",
  }) {

    return FormatModel(
      xMobipocketEBook: withXMobipocketEBook,
      ePubZip: withEPubZip,
      rdfXml: withRdfXml,
      textHtmlUtf8: withTextHtmlUtf8,
      textPlain: withTextPlain,
      imageJpeg: withImageJpeg,
      textHtml: withTextHtml, 
    );
  }
}