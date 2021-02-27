part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 207,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "Experiences Movies",
                style: blackTextFont.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              "Buying movie tickets is more practical\n and faster",
              style: greyTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 282,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: RaisedButton(
                child: Text(
                  "Get Started",
                  style: whiteTextFont.copyWith(fontSize: 16),
                ),
                color: mainColor,
                onPressed: () {
                  context
                      .read<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationData()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                elevation: 0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    " Sign In",
                    style: blueTextFont.copyWith(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
