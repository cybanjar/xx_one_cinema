part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);

  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
  // List<Object> get props => throw UnimplementedError();
}

class UpdateData extends UserEvent {
  final String name;
  final String profileImage;

  UpdateData({this.name, this.profileImage});

  @override
  List<Object> get props => [name, profileImage];
}

class TopUp extends UserEvent {
  final int amount; // jumlah yg akan di topup

  TopUp(this.amount);

  @override
  List<Object> get props => [amount];
}

class Purchase extends UserEvent {
  final int amount; // buat belanja tiket

  Purchase(this.amount);

  @override
  List<Object> get props => [amount];
}
