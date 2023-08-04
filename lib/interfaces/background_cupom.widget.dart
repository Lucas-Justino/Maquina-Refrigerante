import 'package:flutter/material.dart';

class BackgroundCupomWidget extends StatelessWidget {
  const BackgroundCupomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 522,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 4,
                offset: const Offset(0, 4)),
          ]),
    );
  }
}
