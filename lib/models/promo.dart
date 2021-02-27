part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.title, @required this.subtitle, @required this.discount});

  @override
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(title: "Family Club", discount: 70, subtitle: "Min for three people"),
  Promo(title: "Subscription Promo", discount: 50, subtitle: "Min. one year"),
];
