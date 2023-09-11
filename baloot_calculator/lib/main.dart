import 'package:baloot_calculator/features/calculator/bloc/score_bloc.dart';
import 'package:baloot_calculator/features/calculator/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: BlocProvider(
        create: (context) => ScoreBloc()..add(GetScoreHistoryEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
