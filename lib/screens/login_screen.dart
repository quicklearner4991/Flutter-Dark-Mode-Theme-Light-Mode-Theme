import 'package:cs_flutter/navigation/app_routes.dart';
import 'package:cs_flutter/providers/login_provider.dart';
import 'package:cs_flutter/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider _loginProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.signup, arguments: 42);
            /*Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignupScreen(1)));*/
          },
          child:
          Column(
            children: [
              SizedBox(height: 100.0,),
              Text('LOGIN SCREEN'),
              Text(_loginProvider.getCounter.toString())
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
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }
}
