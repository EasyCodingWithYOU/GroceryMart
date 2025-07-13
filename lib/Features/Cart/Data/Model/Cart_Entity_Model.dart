import 'dart:convert';

import 'package:grocery_mart/Features/Cart/Domain/Entity/Cart_Entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required String id,
    required String imageUrl,
    required String name,
    required int quantity,
    required double price,
    required bool favourite,
    required String productDetail,
    required String nutrition,
    required String review,
    required double rating,
    required int orderQuantity,
  }) : super(
         id: id,
         imageUrl: imageUrl,
         name: name,
         quantity: quantity,
         price: price,
         favourite: favourite,
         productDetail: productDetail,
         nutrition: nutrition,
         review: review,
         rating: rating,
         orderQuantity: orderQuantity,
       );

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      id: entity.id,
      imageUrl: entity.imageUrl,
      name: entity.name,
      quantity: entity.quantity,
      price: entity.price,
      favourite: entity.favourite,
      productDetail: entity.productDetail,
      nutrition: entity.nutrition,
      review: entity.review,
      rating: entity.rating,
      orderQuantity: entity.orderQuantity,
    );
  }

  CartItemEntity toEntity() => this;

  static String encode(List<CartItemModel> items) =>
      jsonEncode(items.map((e) => e.toJson()).toList());

  static List<CartItemModel> decode(String jsonString) =>
      (jsonDecode(jsonString) as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList();

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageUrl": imageUrl,
    "name": name,
    "quantity": quantity,
    "price": price,
    "favourite": favourite,
    "productDetail": productDetail,
    "nutrition": nutrition,
    "review": review,
    "rating": rating,
    "orderQuantity": orderQuantity,
  };

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      favourite: json['favourite'],
      productDetail: json['productDetail'],
      nutrition: json['nutrition'],
      review: json['review'],
      rating: json['rating'].toDouble(),
      orderQuantity: json['orderQuantity'],
    );
  }
}
