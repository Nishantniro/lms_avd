import 'package:dartz/dartz.dart';
import 'package:lms_adv/core/error/falilure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
