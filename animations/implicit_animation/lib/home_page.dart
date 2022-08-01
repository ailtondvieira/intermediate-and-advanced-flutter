import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  double targetValue = 24.0;

  void changeClicked() {
    isClicked = !isClicked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              MaterialButton(
                onPressed: () {
                  changeClicked();
                },
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  color: Colors.red,
                  child: AnimatedAlign(
                    alignment:
                        isClicked ? Alignment.topRight : Alignment.bottomLeft,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: const FlutterLogo(size: 50.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              AnimatedOpacity(
                opacity: isClicked ? 1 : 0.3,
                duration: const Duration(seconds: 2),
                child: AnimatedContainer(
                  onEnd: () {
                    changeClicked();
                  },
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                  width: isClicked ? MediaQuery.of(context).size.width : 75,
                  height: isClicked ? 200 : 75,
                  color: isClicked ? Colors.orange : Colors.pink,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  changeClicked();
                },
                child: const Text('Aumentar/Diminuir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
