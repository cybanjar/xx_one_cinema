part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("Cibinong City XXI"),
  Theater("Cinere Mall XXI"),
  Theater("Ciputra Mall XXI"),
  Theater("Grand Indonesia XXI"),
];
