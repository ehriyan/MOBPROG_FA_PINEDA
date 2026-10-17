import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Genre {
  fiction,
  nonfiction,
  mystery,
  romance,
  science,
  fantasy,
  biography,
  history,
}

enum ReadingStatus {
  wantToRead,
  currentlyReading,
  finished,
}

class Book {
  Book({
    required this.title,
    required this.author,
    required this.pages,
    required this.rating,
    required this.genre,
    required this.status,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String author;
  final int pages;
  final int rating;
  final Genre genre;
  ReadingStatus status;
}
