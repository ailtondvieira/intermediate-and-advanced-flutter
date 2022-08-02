import 'package:flutter/material.dart';

import '../utils/constants_animation.dart';
import 'radial_expansion_widget.dart';

class HeroDestinyPage extends StatelessWidget {
  final String imageName;
  final String description;

  const HeroDestinyPage({
    Key? key,
    required this.imageName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(description),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        alignment: FractionalOffset.center,
        child: SizedBox(
          height: kMaxRadius * 2,
          width: kMaxRadius * 2,
          child: Hero(
            tag: imageName,
            createRectTween: createRectTween,
            child: RadialExpansion(
              maxRadius: kMaxRadius,
              child: Material(
                color: Colors.pink.shade50,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    imageName,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
