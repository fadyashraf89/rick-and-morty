import 'package:flutter/material.dart';
import 'package:flutter_rickandmorty/AppRouter.dart';

void main() {
  runApp(RickAndMorty(
    router: AppRouter(),
  ));
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
