class Space {
  int id;
  String name;
  String city;
  String country;
  int price;
  String imageUrl;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int totalKitchens;
  int totalBedroom;
  int totalCupBoard;

  Space({
    this.id,
    this.name,
    this.city,
    this.country,
    this.price,
    this.imageUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.totalKitchens,
    this.totalBedroom,
    this.totalCupBoard,
  });

  Space.fromJson(json) {
    this.id = json['id'];
    this.name = json['name'];
    this.city = json['city'];
    this.country = json['country'];
    this.price = json['price'];
    this.imageUrl = json['image_url'];
    this.rating = json['rating'];
    this.address = json['address'];
    this.phone = json['phone'];
    this.mapUrl = json['map_url'];
    this.photos = json['photos'];
    this.totalKitchens = json['number_of_kitchens'];
    this.totalBedroom = json['number_of_bedrooms'];
    this.totalCupBoard = json['number_of_cupboards'];
  }
}
