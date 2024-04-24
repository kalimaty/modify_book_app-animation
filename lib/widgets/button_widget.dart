import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClicked,
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment(0, 0),
          height: 100,
          width: 100,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.inversePrimary,
              boxShadow: [
                // BoxShadow(
                //   color: Colors.black.withOpacity(0.4),
                //   blurRadius: 2,
                //   spreadRadius: 2,
                // )
              ]),
          child: Text(
            textAlign: TextAlign.right,
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );
  // ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         minimumSize: Size.fromHeight(50),
  //       ),
  //       child: Text(text,
  //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  //       onPressed: onClicked,
  //     );
}
