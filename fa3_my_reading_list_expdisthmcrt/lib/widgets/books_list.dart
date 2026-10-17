import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BooksList extends StatelessWidget {
  const BooksList({
    super.key,
    required this.books,
    required this.onRemoveBook,
    required this.onUpdateStatus,
  });

  final List<Book> books;
  final void Function(Book book) onRemoveBook;
  final void Function(Book book, ReadingStatus newStatus) onUpdateStatus;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            margin: Theme.of(context).cardTheme.margin,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ),
          key: ValueKey(books[index].id),
          onDismissed: (direction) {
            onRemoveBook(books[index]);
          },
          child: BookItem(
            book: books[index],
            onUpdateStatus: onUpdateStatus,
          ),
        );
      },
    );
  }
}
