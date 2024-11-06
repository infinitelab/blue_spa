import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
    );
  }

  AppBar appBar(BuildContext context) => AppBar(
        title: Text(
          'Blue Spa',
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .copyWith(color: Colors.blue),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined))
        ],
      );
}
