import 'package:flutter/material.dart';

import 'circle_hero_footer.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      alignment: FractionalOffset.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const Text(
            'Selecione uma imagem',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CircleHeroFooter(
                imageName: 'images/onepiece1.png',
                description: 'Beachball',
              ),
              CircleHeroFooter(
                imageName: 'images/onepiece2.png',
                description: 'Binoculars',
              ),
              CircleHeroFooter(
                imageName: 'images/onepiece3.png',
                description: 'Chair',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
