import 'package:gutenberg_library/features/book/domain/entities/book.dart';

class BookFactory {

  static Book newBook({
    int withId = -1,
    String withTitle = "title -1",
    List<String> withAuthors = const ["author -1"],
    String withImageUrl = "imageUrl -1",
    int withDownloadCount = -1,
    String withEBookUrl = "eBookUrl -1",
    List<String> withBookshelves = const["bookshelf -1"]
  }) {
    return Book(
      id: withId,
      title: withTitle,
      authors: withAuthors,
      imageUrl: withImageUrl,
      downloadCount: withDownloadCount,
      eBookUrl: withEBookUrl,
      bookshelves: withBookshelves
    );
  }
}
