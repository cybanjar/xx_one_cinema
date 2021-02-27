part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: Image.asset("assets/logo_child.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 40),
                  child: Text(
                    "Welcome Back, \n Please Login",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isEmailValid = EmailValidator.validate(text);
                    });
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email Address",
                      labelText: "Email Address",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      isPasswordValid = value.length >= 6;
                    });
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  maxLength: 8,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password? ",
                      style: greyTextFont.copyWith(fontSize: 16),
                    ),
                    Text(
                      "Click Here",
                      style: blueTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 46,
                    decoration: isEmailValid && isPasswordValid
                        ? BoxDecoration(boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 20,
                              color: mainColor.withOpacity(0.23),
                            )
                          ])
                        : BoxDecoration(boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: mainColor.withOpacity(0.025),
                            )
                          ]),
                    margin: EdgeInsets.only(top: 32, bottom: 16),
                    child: isSignIn
                        ? SpinKitDoubleBounce(
                            color: mainColor,
                          )
                        : RaisedButton(
                            child: Text(
                              "Log In",
                              style: whiteTextFont.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            color: isEmailValid && isPasswordValid
                                ? mainColor
                                : Color(0xFFE4E4E4),
                            onPressed: isEmailValid && isPasswordValid
                                ? () async {
                                    setState(() {
                                      isSignIn = true;
                                    });

                                    SignInSignUpResult result =
                                        await AuthServices.signIn(
                                            emailController.text,
                                            passwordController.text);

                                    if (result.user == null) {
                                      setState(() {
                                        isSignIn = false;
                                      });

                                      Flushbar(
                                        duration: Duration(seconds: 4),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Color(0xFFFF5C83),
                                        message: result.message,
                                      )..show(context);
                                    }
                                  }
                                : null,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)),
                            elevation: 0,
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: greyTextFont.copyWith(fontSize: 16),
                    ),
                    Text(
                      "Sign Up",
                      style: blueTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
