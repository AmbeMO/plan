import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget{
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}
class _AuthorizationPageState extends State<AuthorizationPage>{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;


  @override
  Widget build(BuildContext context) {


    Widget _logo(){
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text('Sport managing', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.purple),),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.purple),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 3)
            ),
              enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1)
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.purple),
                  child: icon,
                ),
              )
          ),
        ),
      );
    }


    Widget _button(String text, void func()){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.purple,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20)
        ),
        onPressed: (){
          func();
        },
      );
    }

    Widget _form(String label, void func()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.email), 'EMAIL', _emailController, false)
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(Icon(Icons.lock), 'PASSWORD', _passwordController, true)
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func)
              ),
            )
          ],
        ),
      );
    }


    void _buttonAction(){
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            _logo(),
            SizedBox(height: 100),
            (
                showLogin
                ? Column(
                  children: <Widget>[
                    _form('LOGIN', _buttonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text('Not registered yet? Register!', style: TextStyle(fontSize: 20, color: Colors.purple)),
                        onTap:() {
                          setState((){
                            showLogin = false;
                      });
                      }
                      ),
                    )
                  ],
                )
                : Column(
                  children: <Widget>[
                    _form('REGISTER', _buttonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Text('Already registered? LOGIN!', style: TextStyle(fontSize: 20, color: Colors.purple)),
                          onTap:() {
                            setState((){
                              showLogin = true;
                            });
                          }
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
    );
  }

}