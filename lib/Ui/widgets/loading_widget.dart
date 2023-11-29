import 'package:flutter/material.dart';

class LoadingWidegt extends StatelessWidget{

  const LoadingWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
