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
    _controller.forward();

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
                    child: Image.asset(
                      'assets/logo.png',
                      width: size.width * 0.55,
                    ),
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _controller.value * -100),
                        child: child,
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
