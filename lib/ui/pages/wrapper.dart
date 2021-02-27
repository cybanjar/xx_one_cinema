part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // memberitahukan jika ada perubahan di firebase
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      // lempar ke login
      // return SignInPage();
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      // lempar ke main page
      // return MainPage();
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        context.bloc<TicketBloc>().add(GetTickets(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movie)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetail)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticket)
                                        : (pageState is OnCheckOutPage)
                                            ? CheckoutPage(pageState.ticket)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(pageState.ticket,
                                                    pageState.transaction)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticket)
                                                    : (pageState
                                                            is OnProfilePage)
                                                        ? ProfilePage()
                                                        : (pageState
                                                                is OnTopupPage)
                                                            ? TopupPage(
                                                                pageState
                                                                    .pageEvent)
                                                            : (pageState
                                                                    is OnWalletPage)
                                                                ? WalletPage(
                                                                    pageState
                                                                        .pageEvent)
                                                                : (pageState
                                                                        is OnEditProfilePage)
                                                                    ? EditProfilePage(
                                                                        pageState
                                                                            .user)
                                                                    : (pageState
                                                                            is OnMainPage)
                                                                        ? MainPage(
                                                                            bottomNavbarIndex:
                                                                                pageState.bottomNavbarIndex,
                                                                            isExpired:
                                                                                pageState.isExpired,
                                                                          )
                                                                        : Container());
  }
}
