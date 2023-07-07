import 'package:flutter/material.dart';



class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green
                    ),
                    child: const  Center(child:Text("D")),
                  ),
                  const Text(
                    'Your library',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
