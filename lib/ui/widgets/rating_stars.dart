part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverange;
  final double starSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment alignment;

  RatingStars(
      {this.voteAverange = 0,
      this.starSize = 20,
      this.fontSize = 12,
      this.color,
      this.alignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    // menghitung jumlah bintang yang nyala
    int n = (voteAverange / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: starSize,
            ));
    widgets.add(SizedBox(
      width: 3,
    ));
    widgets.add(Text(
      "$voteAverange/10",
      style: whiteNumberFont.copyWith(
          fontWeight: FontWeight.w300, fontSize: fontSize),
    ));

    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}