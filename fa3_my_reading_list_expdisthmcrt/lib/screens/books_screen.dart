import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/widgets/books_chart.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/widgets/books_list.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/widgets/new_book.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/widgets/reading_summary.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  final void Function() onToggleTheme;
  final bool isDarkMode;

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final List<Book> _registeredBooks = [
    Book(
      title: 'The Secret Garden',
      author: 'Frances Hodgson Burnett',
      pages: 331,
      rating: 5,
      genre: Genre.fiction,
      status: ReadingStatus.currentlyReading,
    ),
    Book(
      title: 'Tomorrow and Tomorrow and Tomorrow',
      author: 'Gabrielle Zevin',
      pages: 399,
      rating: 4,
      genre: Genre.fiction,
      status: ReadingStatus.wantToRead,
    ),
    Book(
      title: 'When Breath Becomes Air',
      author: 'Paul Kalanithi',
      pages: 256,
      rating: 4,
      genre: Genre.nonfiction,
      status: ReadingStatus.finished,
    ),
  ];

  void _openAddBookModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewBook(onAddBook: _addBook),
    );
  }

  void _addBook(Book book) {
    setState(() {
      _registeredBooks.add(book);
    });
  }

  void _removeBook(Book book) {
    final bookIndex = _registeredBooks.indexOf(book);

    setState(() {
      _registeredBooks.remove(book);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Book removed.'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredBooks.insert(bookIndex, book);
            });
          },
        ),
      ),
    );
  }

  void _updateBookStatus(Book book, ReadingStatus newStatus) {
    setState(() {
      book.status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No books added yet. Tap + to add one!'),
    );

    if (_registeredBooks.isNotEmpty) {
      mainContent = const Center(
        child: Text('List of books will appear here.'),
      );

      mainContent = BooksList(
        books: _registeredBooks,
        onRemoveBook: _removeBook,
        onUpdateStatus: _updateBookStatus,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reading List'),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: widget.isDarkMode
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
          ),
          IconButton(
            onPressed: _openAddBookModal,
            icon: const Icon(Icons.add),
            tooltip: 'Add New Book',
          ),
        ],
      ),
      body: Column(
        children: [
          ReadingSummary(books: _registeredBooks),
          BooksChart(books: _registeredBooks),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
