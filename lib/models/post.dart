class Post {
  String? date;
  String? imageURL;
  double? latitude;
  double? longitude;
  int? quantity;

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'imageURL': imageURL,
      'latitude': latitude,
      'longitude': longitude,
      'quantity': quantity
    };
  }

}