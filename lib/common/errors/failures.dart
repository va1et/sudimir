import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure extends Equatable {
  final String? cause;
  final Image? img;
  const Failure([this.cause, this.img]);

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure([String? cause, Image? img]) : super(cause, img);
}

class CacheFailure extends Failure {
  const CacheFailure([String? cause, Image? img]) : super(cause, img);
}
