import 'package:flutter/material.dart';
import 'package:icecreamapp/icrecream/icecream_view.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: IcecreamView()),
    );
  }
}
