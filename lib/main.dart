import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/backend/shared_preferences.dart';
import 'package:wordcup_album_2026/core/theme/app_theme.dart';
import 'package:wordcup_album_2026/helper/create_collection_helper.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/screens/collection_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await SharedPrefs.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final List<Sticker> collection = CreateCollectionHelper.createNewCollection();

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Cup 2026',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      home: CollectionScreen(collection: collection),
    );
  }
}

