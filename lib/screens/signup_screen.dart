import 'package:cs_flutter/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen( this.title, {Key? key}) : super(key: key);
  final int title;
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late SignupProvider _signupProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: InkWell(
          onTap: () {
            /*Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignupScreen(1)));*/
          },
          child: Column(
            children: [
              SizedBox(height: 100.0,),
              Text('SIGNUP SCREEN'),
              Text(widget.title.toString())
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signupProvider = Provider.of<SignupProvider>(context, listen: false);
  }
}
