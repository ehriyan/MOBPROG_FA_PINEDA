import 'package:fa3_my_reading_list_expdisthmcrt/constants.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:flutter/material.dart';

class NewBook extends StatefulWidget {
  const NewBook({
    super.key,
    required this.onAddBook,
  });

  final void Function(Book book) onAddBook;

  @override
  State<NewBook> createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _pagesController = TextEditingController();
  final _ratingController = TextEditingController();

  Genre _selectedGenre = Genre.fiction;
  ReadingStatus _selectedStatus = ReadingStatus.wantToRead;

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _pagesController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  void _submitBookData() {
    final enteredTitle = _titleController.text.trim();
    final enteredAuthor = _authorController.text.trim();
    final enteredPages = int.tryParse(_pagesController.text);
    final enteredRating = int.tryParse(_ratingController.text);

    final titleIsInvalid = enteredTitle.isEmpty;
    final authorIsInvalid = enteredAuthor.isEmpty;
    final pagesIsInvalid = enteredPages == null || enteredPages <= 0;
    final ratingIsInvalid =
        enteredRating == null || enteredRating < 1 || enteredRating > 5;

    if (titleIsInvalid ||
        authorIsInvalid ||
        pagesIsInvalid ||
        ratingIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure all fields are filled out correctly.\n\n'
            '- Pages must be greater than 0.\n'
            '- Rating must be a whole number between 1 and 5.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    final newBook = Book(
      title: enteredTitle,
      author: enteredAuthor,
      pages: enteredPages,
      rating: enteredRating,
      genre: _selectedGenre,
      status: _selectedStatus,
    );

    widget.onAddBook(newBook);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(label: Text('Book Title')),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(label: Text('Author')),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _pagesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('Pages')),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _ratingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Rating (1-5)'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<Genre>(
                    value: _selectedGenre,
                    isExpanded: true,
                    items: Genre.values.map((genre) {
                      return DropdownMenuItem(
                        value: genre,
                        child: Row(
                          children: [
                            Icon(
                              genreIcons[genre],
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(genre.name.toUpperCase()),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedGenre = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<ReadingStatus>(
                    value: _selectedStatus,
                    isExpanded: true,
                    items: ReadingStatus.values.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(
                          statusLabels[status]!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedStatus = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _submitBookData,
                  child: const Text('Save Book'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
