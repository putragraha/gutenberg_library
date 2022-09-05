import 'package:gutenberg_library/features/book/domain/entities/book.dart';

class BookBuilder {
  int id = -1;

  String title = "title -1";

  List<String> authors = List.unmodifiable(["author -1"]);

  String imageUrl = "imageUrl -1";

  int downloadCount = -1;

  String eBookUrl = "eBookUrl -1";

  List<String> bookshelves = List.unmodifiable(["bookshelf -1"]);

  BookBuilder setId(int id) {
    this.id = id;
    return this;
  }

  BookBuilder setTitle(title) {
    this.title = title;
    return this;
  }

  BookBuilder setAuthors(authors) {
    this.authors = authors;
    return this;
  }

  BookBuilder setImageUrl(imageUrl) {
    this.imageUrl = imageUrl;
    return this;
  }

  BookBuilder setDownloadCount(downloadCount) {
    this.downloadCount = downloadCount;
    return this;
  }

  BookBuilder setEBookUrl(eBookUrl) {
    this.eBookUrl = eBookUrl;
    return this;
  }

  BookBuilder setBookshelves(bookshelves) {
    this.bookshelves = bookshelves;
    return this;
  }

  Book build() {
    return Book(
      id: id,
      title: title,
      authors: authors,
      imageUrl: imageUrl,
      downloadCount: downloadCount,
      eBookUrl: eBookUrl,
      bookshelves: bookshelves
    );
  }
}
