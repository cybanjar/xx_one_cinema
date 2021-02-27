part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final CinemaTransaction transaction;

  SuccessPage(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return;
        },
        child: Scaffold(
          body: FutureBuilder(
              future: ticket != null
                  ? processingTicketOrder(context)
                  : processingTopUp(context),
              builder: (_, snapshot) => (snapshot.connectionState ==
                      ConnectionState.done)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(bottom: 70),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ticket == null
                                        ? "assets/icon_checklist.png"
                                        : "assets/icon_checklist.png"))),
                          ),
                          Text(
                            (ticket == null)
                                ? "Ohhhh Yeahh!"
                                : "Happy Watching",
                            style: blackTextFont.copyWith(fontSize: 20),
                          ),
                          SizedBox(height: 16),
                          Text(
                            (ticket == null)
                                ? "You have successfully top up the wallet"
                                : "You have successfully bought the ticket",
                            textAlign: TextAlign.center,
                            style: greyTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          Container(
                              height: 45,
                              width: 250,
                              margin: EdgeInsets.only(top: 70, bottom: 20),
                              child: RaisedButton(
                                  elevation: 0,
                                  color: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(23)),
                                  child: Text(
                                    (ticket == null)
                                        ? "My Wallet"
                                        : "My Tickets",
                                    style: whiteTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    if (ticket == null) {
                                      context
                                          .read<PageBloc>()
                                          .add(GoToWalletPage(GoToMainPage()));
                                    } else {
                                      context.read<PageBloc>().add(
                                          GoToMainPage(bottomNavbarIndex: 1));
                                    }
                                  })),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Discover new movie? ",
                                style: greyTextFont.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<PageBloc>().add(GoToMainPage());
                                },
                                child:
                                    Text("Back to home", style: blueTextFont),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: SpinKitDoubleBounce(color: mainColor, size: 50),
                    )),
        ));
  }

  // context karena butuh user bloc
  Future<void> processingTicketOrder(BuildContext context) async {
    // context.read<UserBloc>().add(Purchase(ticket.totalPrice));
    BlocProvider.of<UserBloc>(context).add(Purchase(ticket.totalPrice));

    // context.read<TicketBloc>().add(BuyTicket(ticket, transaction.userID));
    BlocProvider.of<TicketBloc>(context)
        .add(BuyTicket(ticket, transaction.userID));

    await CinemaTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) async {
    // context.read<UserBloc>().add(TopUp(transaction.amount));
    BlocProvider.of<UserBloc>(context).add(TopUp(transaction.amount));

    await CinemaTransactionServices.saveTransaction(transaction);
  }
}
