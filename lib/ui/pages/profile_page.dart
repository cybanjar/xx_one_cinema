part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: <Widget>[
                  BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) {
                      if (userState is UserLoaded) {
                        User user = userState.user;

                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 74, bottom: 10),
                              width: 120,
                              height: 120,
                              child: Stack(
                                children: <Widget>[
                                  Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitDoubleBounce(
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: 120,
                                    // height: 120,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: (user.profilePicture != "")
                                                ? NetworkImage(
                                                    user.profilePicture)
                                                : AssetImage(
                                                    "assets/user_pic.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              child: Text(
                                user.name.toUpperCase(),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: blackTextFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              margin: EdgeInsets.only(top: 8, bottom: 30),
                              child: Text(
                                user.email,
                                textAlign: TextAlign.center,
                                style: greyTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        );
                      } else
                        return SizedBox();
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToEditProfilePage(
                                (userState as UserLoaded).user));
                          },
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Icon(
                                  MdiIcons.pencil,
                                  color: mainColor,
                                  size: 24,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Edit Profile",
                                style: blackTextFont.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: defaultMargin),
                          child: Divider(
                            color: Color(0xFFE4E4E4),
                            thickness: 1,
                          )),
                      GestureDetector(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToWalletPage(GoToProfilePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(
                                MdiIcons.wallet,
                                color: mainColor,
                                size: 24,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Wallet",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: defaultMargin),
                          child: Divider(
                            color: Color(0xFFE4E4E4),
                            thickness: 1,
                          )),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Icon(
                              MdiIcons.information,
                              color: mainColor,
                              size: 24,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "About",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width - defaultMargin,
                        height: 46,
                        margin: EdgeInsets.only(top: 70, bottom: 16),
                        child: RaisedButton(
                          child: Text(
                            "Sign Out",
                            style: whiteTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          color: mainColor,
                          onPressed: () async {
                            await AuthServices.signOut();
                            context.bloc<UserBloc>().add(SignOut());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  context.bloc<PageBloc>().add(GoToMainPage());
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
