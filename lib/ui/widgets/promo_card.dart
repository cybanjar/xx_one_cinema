part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // margin: EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [mainColor, accentColor1])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(promo.title, style: whiteTextFont),
                  Text(
                    promo.subtitle,
                    style: whiteTextFont.copyWith(
                        fontWeight: FontWeight.w300, fontSize: 11),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "OFF ",
                    style: whiteNumberFont.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${promo.discount}%",
                    style: whiteNumberFont.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
