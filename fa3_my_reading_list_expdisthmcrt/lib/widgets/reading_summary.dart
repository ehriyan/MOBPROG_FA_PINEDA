import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:flutter/material.dart';

class ReadingSummary extends StatelessWidget {
  const ReadingSummary({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final totalBooks = books.length;
    final wantToReadBooks = books
        .where((b) => b.status == ReadingStatus.wantToRead)
        .length;
    final finishedBooks = books
        .where((b) => b.status == ReadingStatus.finished)
        .length;
    final readingBooks = books
        .where((b) => b.status == ReadingStatus.currentlyReading)
        .length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
      child: Column(
        children: [
          Text(
            'Reading Sumary',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('Total', totalBooks.toString(), context),
              _buildStatItem('To Read', wantToReadBooks.toString(), context),
              _buildStatItem('Reading', readingBooks.toString(), context),
              _buildStatItem('Finished', finishedBooks.toString(), context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
