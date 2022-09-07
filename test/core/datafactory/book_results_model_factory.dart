import 'package:gutenberg_library/features/book/data/models/book_results_model.dart';
import 'package:gutenberg_library/features/book/data/models/format_model.dart';
import 'package:gutenberg_library/features/book/data/models/person_model.dart';

import 'format_model_factory.dart';
import 'person_model_factory.dart';

class BookResultsModelFactory {
  
  static BookResultsModel newBookResultsModel({
    int withId = 1342,
    String withTitle = "Pride and Prejudice",
    List<PersonModel>? withAuthors,
    List<String> withSubjects = const [
      "Courtship -- Fiction",
      "Domestic fiction",
      "England -- Fiction",
      "Love stories",
      "Sisters -- Fiction",
      "Social classes -- Fiction",
      "Young women -- Fiction"
    ],
    List<String> withBookshelves = const [
      "Best Books Ever Listings",
      "Harvard Classics"
    ],
    List<PersonModel> withTranslators = const [],
    List<String> withLanguages = const ["en"],
    bool? withCopyright = false,
    String withMediaType = "Text",
    FormatModel? withFormats,
    int withDownloadCount = 52612
  }) {
    withAuthors ??= [PersonModelFactory.newPersonModel()];
    withFormats ??= FormatModelFactory.newFormatModel();

    return BookResultsModel(
      id: withId,
      title: withTitle,
      authors: withAuthors,
      subjects: withSubjects,
      translators: withTranslators,
      bookshelves: withBookshelves,
      languages: withLanguages,
      copyright: withCopyright,
      mediaType: withMediaType,
      formats: withFormats,
      downloadCount: withDownloadCount,
    );
  }
}
