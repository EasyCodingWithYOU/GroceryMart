import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final String id;
  final String imageUrl;
  final String name;
  final int quantity;
  final double price;
  final bool favourite;
  final String productDetail;
  final String nutrition;
  final String review;
  final double rating;
  final int orderQuantity;

  const CartItemEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
    required this.favourite,
    required this.productDetail,
    required this.nutrition,
    required this.review,
    required this.rating,
    required this.orderQuantity,
  });

  @override
  List<Object?> get props => [id, orderQuantity];
}
