import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge_01_01/Constants/constants.dart';
import 'package:flutter_ui_challenge_01_01/Constants/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UI Challenger Day 1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomeChallenge(text: title),
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}

class MyHomeChallenge extends StatelessWidget {
  const MyHomeChallenge({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: (WaveTopPart(text: text)),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.12,
            right: MediaQuery.of(context).size.width * 0.12,
          ),
          child: Column(
            children: [
              const TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: emailHint,
                  hintStyle: TextStyle(
                    color: kTextGrey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 12,
                  color: kTextGrey,
                ),
              ),
              const TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: passwordHint,
                    hintStyle: TextStyle(
                      color: kTextGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                      size: 17,
                    )),
                style: TextStyle(
                  fontSize: 12,
                  color: kTextGrey,
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text(
                  butTonText,
                  style: TextStyle(
                    letterSpacing: 2,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: kButonColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 40),
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                loginText,
                style: TextStyle(color: kTextGrey),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: loginTextLink,
                      style: TextStyle(
                          color: kButonColor,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WaveTopPart extends StatelessWidget {
  const WaveTopPart({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomPathClipper(),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [kGradientStart, kGradientFinal],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 9,
              left: MediaQuery.of(context).size.width / 7,
            ),
            child: const Image(
              height: 300,
              alignment: Alignment.bottomCenter,
              image: AssetImage(Assets.Logo0),
              color: Color.fromRGBO(255, 255, 255, 0.4),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3.5,
              left: MediaQuery.of(context).size.width / 5,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: kBackgroundColor,
                fontSize: 70,
                fontFamily: 'Pacifico',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPathClipper extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.3);
    //Curva izquierda
    var firstControlPoint = Offset(size.width / 8 - 20, size.height / 1.3 - 60);
    var firstEndPoint = Offset(size.width / 4, size.height / 1.3 - 10);

    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height / 1.3 + 165);
    //El height es el canto izquierdo
    var secondEndPoint = Offset(size.width, size.height / 1.3 + 50);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
