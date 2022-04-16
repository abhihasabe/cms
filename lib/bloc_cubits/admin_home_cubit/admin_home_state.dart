import 'package:equatable/equatable.dart';
import '../../models/count_model.dart';

abstract class AdminState extends Equatable {}

class AdminInitial extends AdminState {
  @override
  List<Object?> get props => [];
}

class AdminLoading extends AdminState {
  @override
  List<Object?> get props => [];
}

class AdminSuccess extends AdminState {
  final String? message;
  final List<Data>? countData;

  AdminSuccess({this.message, this.countData});

  @override
  List<Object?> get props => [message, countData];
}

class AdminError extends AdminState {
  final String? errorMessage;

  AdminError({
    this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
