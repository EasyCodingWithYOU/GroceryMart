import 'package:equatable/equatable.dart';
import 'package:grocery_mart/Features/Cart/Domain/Entity/Cart_Entity.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class AddCart extends CartEvent {
  final CartItemEntity item;
  const AddCart(this.item);
  @override
  List<Object?> get props => [item];
}

class DeleteCart extends CartEvent {
  final String id;
  const DeleteCart(this.id);
  @override
  List<Object?> get props => [id];
}

class UpdateCart extends CartEvent {
  final CartItemEntity item;
  const UpdateCart(this.item);
  @override
  List<Object?> get props => [item];
}

class IncreaseQuantity extends CartEvent {
  final String id;
  const IncreaseQuantity(this.id);
  @override
  List<Object?> get props => [id];
}

class DecreaseQuantity extends CartEvent {
  final String id;
  const DecreaseQuantity(this.id);
  @override
  List<Object?> get props => [id];
}
