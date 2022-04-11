import 'package:calc_pizza_asm/utils/global_theme.dart';
import 'package:flutter/material.dart';

class ThemesApp extends StatelessWidget {
  const ThemesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
        home: const ThemesScreen()
    );
  }
}

class ThemesScreen extends StatefulWidget {
  const ThemesScreen({Key? key}) : super(key: key);

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
