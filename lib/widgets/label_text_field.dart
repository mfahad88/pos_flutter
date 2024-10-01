import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  final double width;
  final String? title;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  const LabelTextField({super.key,this.title,required this.width,this.controller,this.obscureText,this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title??"",textAlign: TextAlign.start,),
        SizedBox(
          width: width,
          height: 50,
          child: TextField(
            textInputAction: textInputAction,
            controller: controller,
            obscureText: obscureText??false,
            decoration: InputDecoration(

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2.0
                )
              )
            ),
          ),
        )
      ],
    );
  }
}
