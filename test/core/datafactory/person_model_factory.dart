import 'package:gutenberg_library/features/book/data/models/person_model.dart';

class PersonModelFactory {

  static PersonModel newPersonModel({
    String withName = "Austen, Jane",
    int withBirthYear = 1775,
    int withDeathYear = 1817
  }) {
    return PersonModel(
      name: withName,
      birthYear: withBirthYear,
      deathYear: withDeathYear
    );
  }
}
