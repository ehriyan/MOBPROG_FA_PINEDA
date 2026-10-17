import 'package:fa3_my_reading_list_expdisthmcrt/models/book.dart';
import 'package:flutter/material.dart';

const Color defaultColor = Colors.redAccent;

final kColorScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
);

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
  brightness: Brightness.dark,
);

const genreIcons = {
  Genre.fiction: Icons.book,
  Genre.nonfiction: Icons.menu_book,
  Genre.mystery: Icons.search,
  Genre.romance: Icons.favorite,
  Genre.science: Icons.science,
  Genre.fantasy: Icons.auto_stories,
  Genre.biography: Icons.person,
  Genre.history: Icons.history_edu,
};

const statusLabels = {
  ReadingStatus.wantToRead: 'Want to Read',
  ReadingStatus.currentlyReading: 'Currently Reading',
  ReadingStatus.finished: 'Finished',
};