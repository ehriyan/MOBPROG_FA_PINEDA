import 'package:fa3_my_reading_list_expdisthmcrt/constants.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:flutter/material.dart';

class BookBucket {
  const BookBucket({
    required this.genre,
    required this.books,
  });

  final Genre genre;
  final List<Book> books;

  BookBucket.forGenre(List<Book> allBooks, this.genre)
    : books = allBooks.where((book) => book.genre == genre).toList();
}

class BooksChart extends StatelessWidget {
  const BooksChart({
    super.key,
    required this.books,
  });

  final List<Book> books;

  List<BookBucket> get buckets {
    return Genre.values.map((genre) {
      return BookBucket.forGenre(books, genre);
    }).toList();
  }

  int get maxBookCount {
    int maxCount = 0;
    for (final bucket in buckets) {
      if (bucket.books.length > maxCount) {
        maxCount = bucket.books.length;
      }
    }
    return maxCount;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: isDarkMode
              ? [
                  Theme.of(context).colorScheme.primaryContainer
                      .withOpacity(0.5),
                  Theme.of(context).colorScheme.primaryContainer
                      .withOpacity(0.2),
                ]
              : [
                  Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Books by Genre',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? Theme.of(context).colorScheme.onSecondaryContainer
                  : Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: maxBookCount == 0
                        ? 0
                        : bucket.books.length / maxBookCount,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets.map((bucket) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    genreIcons[bucket.genre],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
