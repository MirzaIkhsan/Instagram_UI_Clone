import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      print(_controller.value);
                      return Transform.translate(
                        offset: Offset(
                            _controller.value + 5, _controller.value + 5),
                        child: Image.asset(
                          'assets/logo.png',
                          width: size.width * 0.55,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
