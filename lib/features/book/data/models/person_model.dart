import 'package:equatable/equatable.dart';

class PersonModel extends Equatable {

  final String name;

  final int? birthYear;

  final int? deathYear;

  const PersonModel({
    required this.name, 
    this.birthYear, 
    this.deathYear
  });
  
  @override
  List<Object?> get props => [name, birthYear, deathYear];
}
