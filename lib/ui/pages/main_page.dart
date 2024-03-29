part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavbarIndex;
  final bool isExpired;

  MainPage({this.bottomNavbarIndex = 0, this.isExpired = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavbarIndex = widget.bottomNavbarIndex;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavbarIndex = index;
              });
            },
            children: [
              MoviePage(),
              TicketPage(
                isExpiredTicket: widget.isExpired,
              )
            ],
          ),
          createCustomBottomNavbar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 46,
              width: 46,
              margin: EdgeInsets.only(bottom: 42),
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: mainColor,
                  child: Icon(
                    MdiIcons.walletPlus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<PageBloc>().add(GoToTopupPage(GoToMainPage()));
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget createCustomBottomNavbar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavbarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: Color(0xFFE5E5E5),
                currentIndex: bottomNavbarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavbarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title: Text("Movies",
                          style: GoogleFonts.raleway(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavbarIndex == 0)
                            ? "assets/icon_movie.png"
                            : "assets/icon_movie_not.png"),
                      )),
                  BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title: Text("Tikets",
                          style: GoogleFonts.raleway(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavbarIndex == 1)
                            ? "assets/icon_ticket.png"
                            : "assets/icon_ticket_not.png"),
                      ))
                ]),
          ),
        ),
      );
}

class BottomNavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
