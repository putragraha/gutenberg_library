import 'package:gutenberg_library/features/book/domain/entities/book.dart';

class BookFactory {

  static Book newBook({
    int withId = 1342,
    String withTitle = "Pride and Prejudice",
    List<String> withAuthors = const ["Austen, Jane"],
    String withImageUrl = "https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg",
    int withDownloadCount = 52612,
    String withEBookUrl = "https://www.gutenberg.org/files/1342/1342-h/1342-h.htm",
    List<String> withBookshelves = const ["Best Books Ever Listings", "Harvard Classics"],
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
