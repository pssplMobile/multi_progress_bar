import 'package:flutter/material.dart';
import 'package:multi_progress_bar/multi_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: MultiProgressBar(
          enableLegends: true,
          progressList: [
            ProgressItem(title: 'Type A', progress: 0.3, progressColor: Colors.orange),
            ProgressItem(title: 'Type B', progress: 0.4, progressColor: Colors.blue),
            ProgressItem(title: 'Type C', progress: 0.3, progressColor: Colors.teal),
          ],
        )),
      ),
    );
  }
}
