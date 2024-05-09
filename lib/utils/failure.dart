import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class CommonFailure extends Failure {
  CommonFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}
