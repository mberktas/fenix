import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fenix/core/error/failures.dart';

abstract class UseCase<Type, Parm> {
  Future<Either<Failure, Type>> call(Parm params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
