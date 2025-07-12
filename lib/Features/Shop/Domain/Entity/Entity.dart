class CardItemEntity {
  final String id;
  final String imageUrl;
  final String name;
  final int quantity;
  final double price;
  final bool favourite;
  final String productDetail;
  final String nutrition;
  final String review;
  final double rating; // 1.0 to 5.0

  CardItemEntity({
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
  });
}
