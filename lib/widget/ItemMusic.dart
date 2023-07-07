import 'package:flutter/material.dart';

class ItemMusic extends StatelessWidget {
  const ItemMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/album1.jpg', height: 100,),
          const SizedBox(height: 5,),
          const Text(
            'Bài hát 1',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}