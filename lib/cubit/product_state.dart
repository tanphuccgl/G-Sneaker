import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/model/shoes_model.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final ShoesModel shoes;

  const ProductLoaded({required this.shoes});

  @override
  List<Object> get props => [shoes];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}
