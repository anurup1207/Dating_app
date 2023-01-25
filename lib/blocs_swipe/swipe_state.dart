part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();

  @override
  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<User> user;

  SwipeLoaded({required this.user});
  @override
  List<Object> get props => [user];
}

class SwipeError extends SwipeState {}
