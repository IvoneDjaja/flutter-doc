import 'package:flutter/material.dart';
import 'package:flutter_project/drawer.dart';

class FontPage extends StatelessWidget {
  const FontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Font Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Roboto',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              'Roboto 300',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Roboto 500',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Roboto 700',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
