import 'package:easytourism/pages/login_pages.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  final String title = "TURISMO FACIL ONLINE";
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    nextPage();
    super.initState();
  }

  Future<void> nextPage() async{
    Future.delayed(const Duration(seconds:2), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage() ));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Image(image: AssetImage('assets/images/login.png'),width: 200,height: 200),
                  SizedBox(
                      height: 12.0),
                  Text(
                    "WELCOME OUR WORLD",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

