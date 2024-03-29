part of 'pages.dart';

class TopupPage extends StatefulWidget {
  final PageEvent pageEvent;

  TopupPage(this.pageEvent);

  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;

    return WillPopScope(
      onWillPop: () async {
        context.watch<PageBloc>().add(widget.pageEvent);

        return;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                SafeArea(
                    child: Container(
                  margin: EdgeInsets.only(top: 20, left: defaultMargin),
                  child: GestureDetector(
                    onTap: () {
                      context.watch<PageBloc>().add(widget.pageEvent);
                    },
                    child: Icon(Icons.chevron_left, color: Colors.black),
                  ),
                )),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Top Up",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        onChanged: (text) {
                          String temp = '';
                          for (int i = 0; i < text.length; i++) {
                            temp += text.isDigit(i) ? text[i] : '';
                          }

                          setState(() {
                            selectedAmount = int.tryParse(temp) ?? 0;
                          });

                          amountController.text = NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(selectedAmount);

                          amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: amountController.text.length));
                        },
                        controller: amountController,
                        decoration: InputDecoration(
                            labelStyle: greyTextFont,
                            labelText: "Amount",
                            prefixIcon: Icon(Icons.attach_money_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 14),
                          child: Text("Choose amount",
                              style: blackTextFont.copyWith(fontSize: 16)),
                        ),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 14,
                        children: [
                          makeMoneyCard(
                            amount: 50000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 100000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 200000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 300000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 400000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 500000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 1000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 2000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 3000000,
                            width: cardWidth,
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width - defaultMargin,
                        height: 46,
                        child: BlocBuilder<UserBloc, UserState>(
                          builder: (_, userState) => RaisedButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Top Up My Wallet",
                                style: whiteTextFont.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: (selectedAmount > 0)
                                        ? Colors.white
                                        : Color(0xFFBEBEBE)),
                              ),
                              disabledColor: Color(0xFFE4E4E4),
                              color: mainColor,
                              onPressed: (selectedAmount > 0)
                                  ? () {
                                      context.read<PageBloc>().add(GoToSuccessPage(
                                          null,
                                          CinemaTransaction(
                                              userID: (userState as UserLoaded)
                                                  .user
                                                  .id,
                                              title: "Top Up Wallet",
                                              amount: selectedAmount,
                                              subtitle:
                                                  "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                              time: DateTime.now())));
                                    }
                                  : null),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  MoneyCard makeMoneyCard({int amount, double width}) {
    return MoneyCard(
      amount: amount,
      width: width,
      isSelected: amount == selectedAmount,
      onTap: () {
        setState(() {
          if (selectedAmount != amount) {
            selectedAmount = amount;
          } else {
            selectedAmount = 0;
          }

          amountController.text = NumberFormat.currency(
                  locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
              .format(selectedAmount);

          amountController.selection = TextSelection.fromPosition(
              TextPosition(offset: amountController.text.length));
        });
      },
    );
  }
}
