import 'package:flutter/material.dart';

class ButtonVoltarWidget extends StatelessWidget {

  final List<Widget> widgets;
  final double width;
  final double height;

  final Function aoPressionar;

  const ButtonVoltarWidget({Key? key, required this.widgets, required this.width, required this.height, required this.aoPressionar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
          onPressed: () => aoPressionar(),
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            side: BorderSide(color: const Color(0xFFEADDFF).withOpacity(0.99)),
            backgroundColor: const Color(0xFFEADDFF).withOpacity(0.25),
          ),
          child: Row(
            children: widgets,
          )),
    );
  }
}
