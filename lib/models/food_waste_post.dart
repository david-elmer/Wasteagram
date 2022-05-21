/*
Data Transfer Object for storing post data and writing to database
*/

class FoodWastePost {
  int? date;
  String? imageURL;
  double? latitude;
  double? longitude;
  int? quantity;
  String? item;

  FoodWastePost();

  FoodWastePost.fromMap(postMap) {
    date = postMap['date'];
    imageURL = postMap['imageURL'];
    latitude = postMap['latitude'];
    longitude = postMap['longitude'];
    quantity = postMap['quantity'];
    item = postMap['item'];
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'imageURL': imageURL,
      'latitude': latitude,
      'longitude': longitude,
      'quantity': quantity,
      'item': item
    };
  }

}