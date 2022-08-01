import 'package:flutter/material.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Hero(
            tag: 'img1',
            child: Image.network(
              'https://wallpaperaccess.com/full/1975552.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
