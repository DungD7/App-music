import 'package:flutter/material.dart';

class TypeButton extends StatefulWidget {
  String typeButton = '';
  VoidCallback onTap;
  TypeButton({required this.typeButton, required this.onTap, super.key});

  @override
  State<TypeButton> createState() => _TypeButtonState();
}

class _TypeButtonState extends State<TypeButton> {
  Color bgColor = Colors.grey.shade800;
  Color txtColor = Colors.white;
  // String and = '%2C';
  void changeButtonColor() {
    setState(() {
      if (bgColor == Colors.grey.shade800 && txtColor == Colors.white) {
        bgColor = Colors.green;
        txtColor = Colors.black;

        // if (type.value.isEmpty) {
        //   type.value += widget.typeButton;
        // } else {
        //   type.value += '%2C${widget.typeButton}';
        // }
      } else {
        bgColor = Colors.grey.shade800;
        txtColor = Colors.white;
        // urlSearch.value =
        //     'https://api.spotify.com/v1/search?q=${query.value}&type=${widget.typeButton}&market=vn';

        // type.value = type.value.replaceAll(widget.typeButton, '');
        // if (type.value.isNotEmpty) {
        //   if (type.value.characters.first == '%') {
        //     type.value = type.value.substring(3, type.value.length);
        //   } else if (type.value.characters.last == 'C') {
        //     type.value = type.value.substring(0, type.value.length - 3);
        //   } else {
        //     type.value = type.value.replaceAll('%2C%2C', '%2C');
        //   }
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextButton(
          style:
              ButtonStyle(backgroundColor: MaterialStateProperty.all(bgColor)),
          child: Text(
            widget.typeButton,
            style: TextStyle(
              color: txtColor,
              fontSize: 12.5,
            ),
          ),
          onPressed: () {
            changeButtonColor();
          },
        ),
      ),
    );
  }
}
