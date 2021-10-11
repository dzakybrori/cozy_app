class Space {
  final int id;
  final String name;
  final String city;
  final String country;
  final int price;
  final String imageUrl;
  final int rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List photos;
  final int totalKitchens;
  final int totalBedroom;
  final int totalCupBoard;
  late bool isFavorite;

  Space({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.totalKitchens,
    required this.totalBedroom,
    required this.totalCupBoard,
    this.isFavorite = false,
  });

  factory Space.fromJson(json) => Space(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        country: json['country'],
        price: json['price'],
        imageUrl: json['image_url'],
        rating: json['rating'],
        address: json['address'],
        phone: json['phone'],
        mapUrl: json['map_url'],
        photos: json['photos'],
        totalKitchens: json['number_of_kitchens'],
        totalBedroom: json['number_of_bedrooms'],
        totalCupBoard: json['number_of_cupboards'],
      );
}
