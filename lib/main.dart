import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/data/shared_preferences.dart';
import 'package:wordcup_album_2026/presentation/theme/app_theme.dart';
import 'package:wordcup_album_2026/data/create_collection_helper.dart';
import 'package:wordcup_album_2026/presentation/screens/collection_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await SharedPrefs.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Cup 2026',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      home: CollectionScreen(collection: CreateCollectionHelper.createNewCollection()),
    );
  }
}

