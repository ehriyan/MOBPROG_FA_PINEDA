import 'package:fa3_my_reading_list_expdisthmcrt/constants.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
    required this.onUpdateStatus,
  });

  final Book book;
  final void Function(Book book, ReadingStatus newStatus) onUpdateStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 4),

            Text(
              'by ${book.author}',
              style: Theme.of(context).textTheme.titleSmall,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Icon(genreIcons[book.genre]),
                const SizedBox(width: 8),
                Text(
                  '${book.pages} pages \n ${book.rating} / 5 ⭐️',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                DropdownButton<ReadingStatus>(
                  value: book.status,
                  items: ReadingStatus.values.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(
                        statusLabels[status]!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    onUpdateStatus(book, value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
